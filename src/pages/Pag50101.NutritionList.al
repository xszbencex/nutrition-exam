/// <summary>
/// Page Nutrition List (ID 50101).
/// </summary>
page 50101 "Nutrition List"
{
    ApplicationArea = All;
    Caption = 'Nutrition List';
    PageType = List;
    SourceTable = "Nutrition Header";
    UsageCategory = Lists;
    CardPageId = "Nutrition Order";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = rec.Status::Closed;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = rec.Status::Closed;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = rec.Status::Closed;
                }
                field("Nutrition Date"; Rec."Nutrition Date")
                {
                    ToolTip = 'Specifies the value of the Nutrition Date field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = rec.Status::Closed;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = rec.Status::Closed;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ExportNutirtionList)
            {
                Caption = 'Export';
                ApplicationArea = All;
                Image = Export;
                Promoted = true;
                trigger OnAction();
                begin
                    Xmlport.Run(50100, false, false);
                end;
            }
        }
    }
}
