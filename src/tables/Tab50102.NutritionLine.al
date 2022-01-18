/// <summary>
/// Table Nutrition Line (ID 50102).
/// </summary>
table 50102 "Nutrition Line"
{
    Caption = 'Nutrition Line';
    DataClassification = CustomerContent;
    LookupPageId = "Nutrition Order Subpage";
    DrillDownPageId = "Nutrition Order Subpage";

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Táplálkozási szám';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Sorszám';
            DataClassification = CustomerContent;
        }
        field(3; "Macronutrients Code"; Code[20])
        {
            Caption = 'Tápanyag kód';
            DataClassification = CustomerContent;
            TableRelation = Macronutrients;
            trigger OnValidate()
            var
                Macronutrient: Record Macronutrients;
            begin
                Rec.CalcFields(Description);
                Rec.Quantity := 1;
                Macronutrient.Get(Rec."Macronutrients Code");
                Rec."Unit of Measure Code" := Macronutrient."Unit of Measure Code";
                Rec.Protein := Macronutrient.Protein;
                Rec.Fat := Macronutrient.Fat;
                Rec.Carbohydrate := Macronutrient.Carbohydrate;
                Rec.KJ := Macronutrient.KJ;
                Rec.Kcal := Macronutrient.Kcal;
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Megnevezés';
            FieldClass = FlowField;
            CalcFormula = lookup(Macronutrients.Description where("Code" = field("Macronutrients Code")));
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Mennyiség';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.Protein := Rec.Protein * Quantity;
                Rec.Fat := Rec.Fat * Quantity;
                Rec.Carbohydrate := Rec.Carbohydrate * Quantity;
                Rec.KJ := Rec.KJ * Quantity;
                Rec.Kcal := Rec.Kcal * Quantity;
            end;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Mértékegység';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(7; Protein; Decimal)
        {
            Caption = 'Fehérje';
            DataClassification = CustomerContent;
        }
        field(8; Fat; Decimal)
        {
            Caption = 'Zsír';
            DataClassification = CustomerContent;
        }
        field(9; Carbohydrate; Decimal)
        {
            Caption = 'Szénhidrát';
            DataClassification = CustomerContent;
        }
        field(10; KJ; Integer)
        {
            Caption = 'KJ';
            DataClassification = CustomerContent;
        }
        field(11; Kcal; Integer)
        {
            Caption = 'Kcal';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Nutrition No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
