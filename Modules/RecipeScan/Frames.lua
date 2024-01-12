---@class CraftSim
local CraftSim = select(2, ...)

local GGUI = CraftSim.GGUI
local GUTIL = CraftSim.GUTIL
local L = CraftSim.UTIL:GetLocalizer()

CraftSim.RECIPE_SCAN.FRAMES = {}

local print = CraftSim.UTIL:SetDebugPrint(CraftSim.CONST.DEBUG_IDS.RECIPE_SCAN)

function CraftSim.RECIPE_SCAN.FRAMES:Init()

    ---@class CraftSim.RECIPE_SCAN.FRAME : GGUI.Frame
    CraftSim.RECIPE_SCAN.frame = GGUI.Frame({
        parent=ProfessionsFrame.CraftingPage.SchematicForm,
        anchorParent=ProfessionsFrame.CraftingPage.SchematicForm, 
        sizeX=850,sizeY=400,
        frameID=CraftSim.CONST.FRAMES.RECIPE_SCAN, 
        title=L(CraftSim.CONST.TEXT.RECIPE_SCAN_TITLE),
        collapseable=true,
        closeable=true,
        moveable=true,
        frameStrata="DIALOG",
        backdropOptions=CraftSim.CONST.DEFAULT_BACKDROP_OPTIONS,
        onCloseCallback=CraftSim.FRAME:HandleModuleClose("modulesRecipeScan"),
        frameTable=CraftSim.MAIN.FRAMES,
        frameConfigTable=CraftSimGGUIConfig,
    })

    ---@class CraftSim.RECIPE_SCAN.FRAME.CONTENT
    CraftSim.RECIPE_SCAN.frame.content = CraftSim.RECIPE_SCAN.frame.content

    local function createContent(frame)
        frame:Hide()

        ---@class CraftSim.RECIPE_SCAN.FRAME.CONTENT : Frame
        frame.content = frame.content

        local tabSizeX, tabSizeY = frame.content:GetSize()

        ---@class CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB : GGUI.BlizzardTab
        frame.content.recipeScanTab = GGUI.BlizzardTab{
            buttonOptions = {
                label="Recipe Scan",
                offsetY=-3,
            },
            parent=frame.content, anchorParent=frame.content, initialTab=true,
            sizeX=tabSizeX, sizeY=tabSizeY,
            top=true,
        }

        CraftSim.RECIPE_SCAN.FRAMES:InitRecipeScanTab(frame.content.recipeScanTab)

        ---@class CraftSim.RECIPE_SCAN.SCAN_OPTIONS_TAB : GGUI.BlizzardTab
        frame.content.scanOptionsTab = GGUI.BlizzardTab{
            buttonOptions = {
                label="Scan Options",
                anchorA="LEFT", anchorB="RIGHT", anchorParent=frame.content.recipeScanTab.button
            },
            parent=frame.content, anchorParent=frame.content,
            sizeX=tabSizeX, sizeY=tabSizeY,
            top=true,
        }

        CraftSim.RECIPE_SCAN.FRAMES:InitScanOptionsTab(frame.content.scanOptionsTab)

        GGUI.BlizzardTabSystem{frame.content.recipeScanTab, frame.content.scanOptionsTab}

        
    end

    createContent(CraftSim.RECIPE_SCAN.frame)
    GGUI:EnableHyperLinksForFrameAndChilds(CraftSim.RECIPE_SCAN.frame.content)
end

---@param recipeScanTab CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB
function CraftSim.RECIPE_SCAN.FRAMES:InitRecipeScanTab(recipeScanTab)

    ---@class CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB
    recipeScanTab = recipeScanTab
    ---@class CraftSim.RECIPE_SCAN.RECIPE_SCAN_TAB.CONTENT : Frame
    local content = recipeScanTab.content

    content.scanButton = GGUI.Button({
        parent=content,anchorParent=content,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_SCAN_RECIPIES), 
        anchorA="TOP", anchorB="TOP",offsetY=-40,sizeX=15,sizeY=25,adjustWidth=true,
        clickCallback=function ()
            CraftSim.RECIPE_SCAN:StartScan()
        end
    })

    content.cancelScanButton = GGUI.Button({
        parent=content,anchorParent=content.scanButton.frame,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_SCAN_CANCEL),
        anchorA="LEFT", anchorB="RIGHT",sizeX=15,sizeY=25,adjustWidth=true,
        clickCallback=function ()
            CraftSim.RECIPE_SCAN:EndScan()
        end
    })

    content.cancelScanButton:Hide()

    local columnOptions = {
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_RECIPE_HEADER),
            width=150,
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_LEARNED_HEADER),
            width=60,
            justifyOptions={type="H", align="CENTER"}
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_GUARANTEED_HEADER),
            width=80,
            justifyOptions={type="H", align="CENTER"}
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_HIGHEST_RESULT_HEADER), -- icon + upgrade chance
            width=110,
            justifyOptions={type="H", align="CENTER"}
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_AVERAGE_PROFIT_HEADER),
            width=140,
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_TOP_GEAR_HEADER),
            width=120,
            justifyOptions={type="H", align="CENTER"}
        },
        {
            label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INV_AH_HEADER),
            width=80,
            justifyOptions={type="H", align="CENTER"}
        }
    }

    ---@type GGUI.FrameList | GGUI.Widget
    content.resultList = GGUI.FrameList({
        parent = content, anchorParent=content.scanButton.frame, anchorA="TOP", anchorB="BOTTOM",
        showBorder=true,
        sizeY=290, offsetY=-30,
        columnOptions=columnOptions,
        selectionOptions = {
            hoverRGBA={1, 1, 1, 0.1},
            noSelectionColor=true,
            selectionCallback=function (row)
                ---@type CraftSim.RecipeData
                local recipeData = row.recipeData
                if recipeData then
                    C_TradeSkillUI.OpenRecipe(recipeData.recipeID)
                end
            end
        },
        rowConstructor=function (columns)
            local recipeColumn = columns[1]
            local learnedColumn = columns[2]
            local expectedResultColumn = columns[3] 
            local highestResultColumn = columns[4] 
            local averageProfitColumn = columns[5] 
            local topGearColumn = columns[6] 
            local countColumn = columns[7]

            recipeColumn.text = GGUI.Text({
                parent=recipeColumn,anchorParent=recipeColumn,anchorA="LEFT",anchorB="LEFT", justifyOptions={type="H",align="LEFT"}, scale=0.9,
                fixedWidth=recipeColumn:GetWidth(), wrap=true,
            })
            
            learnedColumn.text = GGUI.Text({
                parent=learnedColumn,anchorParent=learnedColumn,justifyOptions={type="H",align="CENTER"},
            })

            function learnedColumn:SetLearned(learned)
                if learned then
                    learnedColumn.text:SetText(CraftSim.MEDIA:GetAsTextIcon(CraftSim.MEDIA.IMAGES.TRUE, 0.125))
                else
                    learnedColumn.text:SetText(CraftSim.MEDIA:GetAsTextIcon(CraftSim.MEDIA.IMAGES.FALSE, 0.125))
                end
            end

            local iconSize = 23

            ---@type GGUI.Icon | GGUI.Widget
            expectedResultColumn.itemIcon = GGUI.Icon({
                parent=expectedResultColumn,anchorParent=expectedResultColumn, sizeX=iconSize, sizeY=iconSize, qualityIconScale=1.4,
            })

            ---@type GGUI.Icon | GGUI.Widget
            highestResultColumn.itemIcon = GGUI.Icon({
                parent=highestResultColumn,anchorParent=highestResultColumn, sizeX=iconSize, sizeY=iconSize, qualityIconScale=1.4,
                offsetX=-25
            })

            ---@type GGUI.Text | GGUI.Widget
            highestResultColumn.noneText = GGUI.Text({
                parent=highestResultColumn,anchorParent=highestResultColumn, text=GUTIL:ColorizeText("-", GUTIL.COLORS.GREY)
            })

            ---@type GGUI.Text | GGUI.Widget
            highestResultColumn.chance = GGUI.Text({
                parent=highestResultColumn, anchorParent=highestResultColumn.itemIcon.frame, anchorA="LEFT", anchorB="RIGHT", offsetX=10,
            })

            ---@type GGUI.Text | GGUI.Widget
            averageProfitColumn.text = GGUI.Text({
                parent=averageProfitColumn,anchorParent=averageProfitColumn, anchorA="LEFT", anchorB="LEFT"
            })

            topGearColumn.gear2Icon = GGUI.Icon({
                parent=topGearColumn, anchorParent=topGearColumn, sizeX=iconSize,sizeY=iconSize, qualityIconScale=1.4,
            })

            topGearColumn.gear1Icon = GGUI.Icon({
                parent=topGearColumn, anchorParent=topGearColumn.gear2Icon.frame, anchorA="RIGHT", anchorB="LEFT", sizeX=iconSize,sizeY=iconSize, qualityIconScale=1.4, offsetX=-10,
            })
            topGearColumn.toolIcon = GGUI.Icon({
                parent=topGearColumn, anchorParent=topGearColumn.gear2Icon.frame, anchorA="LEFT", anchorB="RIGHT", sizeX=iconSize,sizeY=iconSize, qualityIconScale=1.4, offsetX=10
            })
            topGearColumn.equippedText = GGUI.Text({
                parent=topGearColumn, anchorParent=topGearColumn
            })

            function topGearColumn.equippedText:SetEquipped()
                topGearColumn.equippedText:SetText(GUTIL:ColorizeText(L(CraftSim.CONST.TEXT.RECIPE_SCAN_EQUIPPED), GUTIL.COLORS.GREEN))
            end
            function topGearColumn.equippedText:SetIrrelevant()
                topGearColumn.equippedText:SetText(GUTIL:ColorizeText("-", GUTIL.COLORS.GREY))
            end

            countColumn.text = GGUI.Text({
                parent=countColumn, anchorParent=countColumn
            })

        end
    })
end

---@param scanOptionsTab CraftSim.RECIPE_SCAN.SCAN_OPTIONS_TAB
function CraftSim.RECIPE_SCAN.FRAMES:InitScanOptionsTab(scanOptionsTab)
    ---@class CraftSim.RECIPE_SCAN.SCAN_OPTIONS_TAB
    scanOptionsTab = scanOptionsTab
    ---@class CraftSim.RECIPE_SCAN.SCAN_OPTIONS_TAB.CONTENT : Frame
    local content = scanOptionsTab.content

    local initialScanModeValue = CraftSimOptions.recipeScanScanMode
    local initialScanModeLabel = L(CraftSim.RECIPE_SCAN.SCAN_MODES_TRANSLATION_MAP[initialScanModeValue])

    content.scanMode = GGUI.Dropdown({
        parent=content, anchorParent=content, anchorA="TOP", anchorB="TOP", offsetY=-50, width=170,
        initialValue=initialScanModeValue,
        initialLabel=initialScanModeLabel,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_MODE),
        initialData=GUTIL:Map(CraftSim.RECIPE_SCAN.SCAN_MODES, 
        function(scanMode) 
            local localizationID = CraftSim.RECIPE_SCAN.SCAN_MODES_TRANSLATION_MAP[scanMode]
            return {
                label=L(localizationID), 
                value=scanMode
            } 
        end),
        clickCallback = function (self, label, value)
            CraftSimOptions.recipeScanScanMode = value
        end
    })

    local checkBoxSpacingY = 0

    content.includeSoulboundCB = GGUI.Checkbox{
        parent=content, anchorParent=content.scanMode.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY, offsetX=-80,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_SOULBOUND), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_SOULBOUND_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanIncludeSoulbound,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanIncludeSoulbound = checked end
    }

    content.includeNotLearnedCB = GGUI.Checkbox{
        parent=content, anchorParent=content.includeSoulboundCB.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_NOT_LEARNED), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_NOT_LEARNED_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanIncludeNotLearned,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanIncludeNotLearned = checked end
    }

    content.includeGearCB = GGUI.Checkbox{
        parent=content, anchorParent=content.includeNotLearnedCB.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_GEAR), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_INCLUDE_GEAR_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanIncludeGear,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanIncludeGear = checked end
    }

    content.onlyFavorites = GGUI.Checkbox{
        parent=content, anchorParent=content.includeGearCB.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_ONLY_FAVORITES_CHECKBOX), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_ONLY_FAVORITES_CHECKBOX_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanOnlyFavorites,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanOnlyFavorites = checked end
    }

    content.optimizeProfessionToolsCB = GGUI.Checkbox{
        parent=content, anchorParent=content.onlyFavorites.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY-10,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_OPTIMIZE_TOOLS), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_OPTIMIZE_TOOLS_TOOLTIP) ..
        GUTIL:ColorizeText(L(CraftSim.CONST.TEXT.RECIPE_SCAN_OPTIMIZE_TOOLS_WARNING), GUTIL.COLORS.RED),
        initialValue=CraftSimOptions.recipeScanOptimizeProfessionTools,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanOptimizeProfessionTools = checked end
    }

    content.sortByProfitMarginCB = GGUI.Checkbox{
        parent=content, anchorParent=content.optimizeProfessionToolsCB.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_SORT_BY_MARGIN), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_SORT_BY_MARGIN_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanSortByProfitMargin,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanSortByProfitMargin = checked end
    }

    content.useInsightCB = GGUI.Checkbox{
        parent=content, anchorParent=content.sortByProfitMarginCB.frame, anchorA="TOP", anchorB="BOTTOM", offsetY = checkBoxSpacingY,
        label=L(CraftSim.CONST.TEXT.RECIPE_SCAN_USE_INSIGHT_CHECKBOX), 
        tooltip=L(CraftSim.CONST.TEXT.RECIPE_SCAN_USE_INSIGHT_CHECKBOX_TOOLTIP),
        initialValue=CraftSimOptions.recipeScanUseInsight,
        clickCallback=function (_, checked) CraftSimOptions.recipeScanUseInsight = checked end
    }
end

function CraftSim.RECIPE_SCAN:ResetResults()
    local resultList = CraftSim.RECIPE_SCAN.frame.content.recipeScanTab.content.resultList --[[@as GGUI.FrameList]]
    resultList:Remove()
end

---@param recipeData CraftSim.RecipeData
function CraftSim.RECIPE_SCAN.FRAMES:AddRecipe(recipeData)
    local resultList = CraftSim.RECIPE_SCAN.frame.content.recipeScanTab.content.resultList --[[@as GGUI.FrameList]]
    resultList:Add(
    function(row) 
        local columns = row.columns

        local recipeColumn = columns[1]
        local learnedColumn = columns[2]
        local expectedResultColumn = columns[3] 
        local highestResultColumn = columns[4] 
        local averageProfitColumn = columns[5] 
        local topGearColumn = columns[6] 
        local countColumn = columns[7]

        row.recipeData = recipeData

        local recipeRarity = recipeData.resultData.expectedItem:GetItemQualityColor()

        recipeColumn.text:SetText(recipeRarity.hex .. recipeData.recipeName .. "|r")

        learnedColumn:SetLearned(recipeData.learned)

        expectedResultColumn.itemIcon:SetItem(recipeData.resultData.expectedItem)

        if recipeData.resultData.canUpgradeQuality then
            highestResultColumn.itemIcon:Show()
            highestResultColumn.chance:Show()
            highestResultColumn.noneText:Hide()
            highestResultColumn.itemIcon:SetItem(recipeData.resultData.expectedItemUpgrade)
            highestResultColumn.chance:SetText(GUTIL:Round(recipeData.resultData.chanceUpgrade*100, 1) .. "%")
        else
            highestResultColumn.noneText:Show()
            highestResultColumn.itemIcon:Hide()
            highestResultColumn.chance:Hide()
        end
        local averageProfit = recipeData:GetAverageProfit()
        local relativeTo = nil
        if CraftSimOptions.showProfitPercentage then
            relativeTo = recipeData.priceData.craftingCosts
        end
        averageProfitColumn.text:SetText(GUTIL:FormatMoney(averageProfit, true, relativeTo))
        row.averageProfit = averageProfit
        row.relativeProfit = GUTIL:GetPercentRelativeTo(averageProfit, recipeData.priceData.craftingCosts)

        if CraftSimOptions.recipeScanOptimizeProfessionTools then
            if recipeData.professionGearSet:IsEquipped() then
                topGearColumn.equippedText:Show()
                topGearColumn.equippedText:SetEquipped()

                topGearColumn.gear1Icon:Hide()
                topGearColumn.gear2Icon:Hide()
                topGearColumn.toolIcon:Hide()
            else
                topGearColumn.equippedText:Hide()
                if recipeData.isCooking then
                    topGearColumn.gear1Icon:Hide()
                else
                    topGearColumn.gear1Icon:SetItem(recipeData.professionGearSet.gear1.item)
                    topGearColumn.gear1Icon:Show()
                end

                topGearColumn.gear2Icon:SetItem(recipeData.professionGearSet.gear2.item)
                topGearColumn.toolIcon:SetItem(recipeData.professionGearSet.tool.item)

                topGearColumn.gear2Icon:Show()
                topGearColumn.toolIcon:Show()
            end
        else
            topGearColumn.gear1Icon:Hide()
            topGearColumn.gear2Icon:Hide()
            topGearColumn.toolIcon:Hide()
            topGearColumn.equippedText:Show()
            topGearColumn.equippedText:SetIrrelevant()
        end

        -- for inventory count, count all result items together? For now.. Maybe a user will have a better idea!

        local totalCountInv = 0
        local totalCountAH = nil
        for _, resultItem in pairs(recipeData.resultData.itemsByQuality) do
            -- links are already loaded here
            totalCountInv = totalCountInv + GetItemCount(resultItem:GetItemLink(), true, false, true)
            local countAH = CraftSim.PRICEDATA:GetAuctionAmount(resultItem:GetItemLink())

            if countAH then
                totalCountAH = (totalCountAH or 0) + countAH
            end
        end
        
        local countText = tostring(totalCountInv)

        if totalCountAH then
            countText = countText .. " / " .. totalCountAH
        end

        countColumn.text:SetText(countText)

        -- show reagents in tooltip when recipe is hovered

        row.tooltipOptions = {
            text=recipeData.reagentData:GetTooltipText(),
            owner=row.frame,
            anchor="ANCHOR_CURSOR",
        }
    end)

    if CraftSimOptions.recipeScanSortByProfitMargin then
        resultList:UpdateDisplay(function (rowA, rowB)
            return rowA.relativeProfit > rowB.relativeProfit
        end)
    else
        resultList:UpdateDisplay(function (rowA, rowB)
            return rowA.averageProfit > rowB.averageProfit
        end)
    end
    
end