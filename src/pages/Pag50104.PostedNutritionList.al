/// <summary>
/// Page Nutrition List (ID 50101).
/// </summary>
page 50104 "Posted Nutrition List"
{
    ApplicationArea = All;
    Caption = 'Posted Nutrition List';
    PageType = List;
    SourceTable = "Posted Nutrition Header";
    UsageCategory = Lists;
    CardPageId = "Posted Nutrition Order";
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
}
