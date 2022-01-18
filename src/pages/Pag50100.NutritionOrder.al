/// <summary>
/// Page Nutrition Order (ID 50100).
/// </summary>
page 50100 "Nutrition Order"
{
    Caption = 'Nutrition Order';
    PageType = Document;
    SourceTable = "Nutrition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("Nutrition Date"; Rec."Nutrition Date")
                {
                    ToolTip = 'Specifies the value of the Nutrition Date field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            part(Lines; "Nutrition Order Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Nutrition No." = field("No.");
                Editable = PageEditable;
            }
        }

        area(FactBoxes)
        {
            part(CustomerDetail; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Customer No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CloseStatus)
            {
                Caption = 'Lezárás';
                Image = Close;
                ApplicationArea = All;
                Enabled = Rec.Status = Rec.Status::Opened;

                trigger OnAction()
                begin
                    Rec.TestField("Nutrition Date");
                    Rec.Status := enum::"Nutrition Status"::Closed;
                    Rec.Modify();
                end;
            }

            action(ReopenStatus)
            {
                Caption = 'Újranyitás';
                Image = ReOpen;
                ApplicationArea = All;
                Enabled = Rec.Status = Rec.Status::Closed;

                trigger OnAction()
                begin
                    Rec.Status := enum::"Nutrition Status"::Opened;
                    Rec.Modify();
                end;
            }

            action(PostNutrition)
            {
                Caption = 'Könyvelés';
                Image = Post;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PostNutritionMgt: Codeunit "Post Nutrition Mgt.";
                begin
                    PostNutritionMgt.PostNutrition(Rec);
                end;
            }

            action(ExportNutirtionList)
            {
                Caption = 'Export';
                ApplicationArea = All;
                Image = Export;
                trigger OnAction();
                begin
                    Xmlport.Run(50100, false, false);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Nutrition Date" := Today();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Opened then
            PageEditable := true
        else
            PageEditable := false;
    end;

    var
        PageEditable: Boolean;

}
