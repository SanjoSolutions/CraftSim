_, CraftSim = ...

CraftSim.SUPPORTERS.FRAMES = {}

function CraftSim.SUPPORTERS.FRAMES:Init()
    local sizeX = 600
    local sizeY = 500

    local frame = CraftSim.GGUI.Frame({
        parent=ProfessionsFrame, 
        anchorParent=UIParent,
        sizeX=sizeX,sizeY=sizeY,
        frameID=CraftSim.CONST.FRAMES.SUPPORTERS, 
        title=CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.CONTROL_PANEL_SUPPORTERS_BUTTON),
        collapseable=true,
        closeable=true,
        moveable=true,
        backdropOptions=CraftSim.CONST.DEFAULT_BACKDROP_OPTIONS,
        frameStrata="DIALOG",
        frameTable=CraftSim.MAIN.FRAMES,
        frameConfigTable=CraftSimGGUIConfig,
    })

    local function createContent(frame)
        frame:Hide()
        local f = CraftSim.UTIL:GetFormatter()
        frame.content.description = CraftSim.GGUI.Text({
            parent=frame.content,anchorParent=frame.content,anchorA="TOP",anchorB="TOP",offsetY=-40,text=CraftSim.LOCAL:GetText(CraftSim.CONST.TEXT.SUPPORTERS_DESCRIPTION)
        })

        frame.content.donateBox = CraftSim.FRAME:CreateInput(
            nil, frame.content, frame.content.description.frame, "TOP", "BOTTOM", 0, -40, 250, 30, CraftSim.CONST.PAYPAL_ME_URL, function() 
                -- do not let the player remove the link
                frame.content.donateBox:SetText(CraftSim.CONST.PAYPAL_ME_URL)
            end)
            frame.content.donateBox:SetScale(0.75)
            frame.content.donateBoxLabel = CraftSim.FRAME:CreateText(
                f.patreon("Do you want to support CraftSim and also be listed here with your message?\nConsider donating <3"), frame.content, frame.content.donateBox, "BOTTOM", "TOP", 0, 0, 1)

        frame.content.supportersList = CraftSim.GGUI.FrameList({
            parent=frame.content,anchorParent=frame.content.donateBox,offsetY=-30,anchorA="TOP",anchorB="BOTTOM",
            sizeY=350, showHeaderLine = true, rowHeight=60,
            columnOptions={
                {
                    label="Date",
                    width=100,
                },
                {
                    label="Supporter",
                    width=100,
                },
                {
                    label="Type",
                    width=50,
                },
                {
                    label="Message",
                    width=250,
                },
            },
            rowConstructor=function(columns)
                local dateColumn = columns[1]
                local nameColumn = columns[2]
                local typeColumn = columns[3]
                local messageColumn = columns[4]

                ---@type GGUI.Text | GGUI.Widget
                dateColumn.text = CraftSim.GGUI.Text({
                    parent=dateColumn, anchorParent=dateColumn,
                    text="", justifyOptions={type="H", align="LEFT"},
                    fixedWidth=dateColumn:GetWidth(),
                })
                ---@type GGUI.Text | GGUI.Widget
                nameColumn.text = CraftSim.GGUI.Text({
                    parent=nameColumn, anchorParent=nameColumn,
                    text="", justifyOptions={type="H", align="LEFT"},
                    fixedWidth=nameColumn:GetWidth(),
                })
                ---@type GGUI.Text | GGUI.Widget
                typeColumn.text = CraftSim.GGUI.Text({
                    parent=typeColumn, anchorParent=typeColumn,
                    text="", justifyOptions={type="H", align="LEFT"},
                    fixedWidth=typeColumn:GetWidth(),
                })
                ---@type GGUI.Text | GGUI.Widget
                messageColumn.text = CraftSim.GGUI.Text({
                    parent=messageColumn, anchorParent=messageColumn,
                    text="", justifyOptions={type="H", align="LEFT"},
                    fixedWidth=messageColumn:GetWidth(),
                })
            end
        })

        table.foreach(CraftSim.SUPPORTERS:GetList(), function (_, supporter)
            frame.content.supportersList:Add(function (row)
                local dateColumn = row.columns[1]
                local nameColumn = row.columns[2]
                local typeColumn = row.columns[3]
                local messageColumn = row.columns[4]

                dateColumn.text:SetText(supporter.date)
                nameColumn.text:SetText(supporter.name)
                typeColumn.text:SetText(supporter.type)
                messageColumn.text:SetText(supporter.message)
            end)
        end)

        frame.content.supportersList:UpdateDisplay()
    end

    createContent(frame)
end