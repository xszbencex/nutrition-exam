/// <summary>
/// Page Macronutrients List (ID 50106).
/// </summary>
page 50106 "Macronutrients List"
{
    ApplicationArea = All;
    Caption = 'Macronutrients List';
    PageType = List;
    SourceTable = Macronutrients;
    UsageCategory = Lists;
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    Caption = 'Kód';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Leírás';
                    ApplicationArea = All;
                }
                field(Protein; Rec.Protein)
                {
                    Caption = 'Fehérje';
                    ApplicationArea = All;
                }
                field(Fat; Rec.Fat)
                {
                    Caption = 'Zsír';
                    ApplicationArea = All;
                }
                field(Carbohydrate; Rec.Carbohydrate)
                {
                    Caption = 'Szénhidrát';
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Caption = 'Mértékegység';
                    ApplicationArea = All;
                    TableRelation = "Unit of Measure";
                }
                field(KJ; Rec.KJ)
                {
                    Caption = 'KJ';
                    ApplicationArea = All;
                }
                field(Kcal; Rec.Kcal)
                {
                    Caption = 'Kcal';
                    ApplicationArea = All;
                }
            }
        }
    }
}
