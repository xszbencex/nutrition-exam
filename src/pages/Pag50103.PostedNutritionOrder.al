/// <summary>
/// Page Nutrition Order (ID 50100).
/// </summary>
page 50103 "Posted Nutrition Order"
{
    Caption = 'Posted Nutrition Order';
    PageType = Document;
    SourceTable = "Posted Nutrition Header";
    Editable = false;

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

                    /*trigger OnAssistEdit()    // Esetleg a Sales Order alapján hogy egy adott körből lehessen az id és enterre töltse ki
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
                    end;*/
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Nutrition Date"; Rec."Nutrition Date")
                {
                    ToolTip = 'Specifies the value of the Nutrition Date field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
            }

            part(Lines; "Posted Nutrition Order Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Nutrition No." = field("No.");
                Editable = false;
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
