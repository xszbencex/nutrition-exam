/// <summary>
/// Page Nutrition Order Subpage (ID 50102).
/// </summary>
page 50102 "Nutrition Order Subpage"
{
    Caption = 'Nutrition Order Subpage';
    PageType = ListPart;
    SourceTable = "Nutrition Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ToolTip = 'Specifies the value of the Nutrition No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Macronutrients Code"; Rec."Macronutrients Code")
                {
                    ToolTip = 'Specifies the value of the Macronutrients Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                }
                field(Protein; Rec.Protein)
                {
                    ToolTip = 'Specifies the value of the Protein field.';
                    ApplicationArea = All;
                }
                field(Fat; Rec.Fat)
                {
                    ToolTip = 'Specifies the value of the Fat field.';
                    ApplicationArea = All;
                }
                field("Carbohydrate"; Rec.Carbohydrate)
                {
                    ToolTip = 'Specifies the value of the Carbohydrate field.';
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                    ApplicationArea = All;
                }
                field(KJ; Rec.KJ)
                {
                    ToolTip = 'Specifies the value of the KJ field.';
                    ApplicationArea = All;
                }
                field(Kcal; Rec.Kcal)
                {
                    ToolTip = 'Specifies the value of the Kcal field.';
                    ApplicationArea = All;
                }
            }

            group(Totals)
            {
                field("Total Protein"; TotalNutrients.Protein)
                {
                    ApplicationArea = All;
                    Caption = 'Total Protein';
                    Editable = false;
                    ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document.';
                }
            }

        }
    }

    trigger OnOpenPage()
    begin
        TotalNutrients.Reset();
        TotalNutrients.SetFilter("Nutrition No.", TotalHeader."No.");
        TotalNutrients.CalcSums("Protein");
    end;

    var
        TotalNutrients: Record "Nutrition Line";
        TotalHeader: Record "Nutrition Header";
}
