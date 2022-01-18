/// <summary>
/// Table Nutrition Header (ID 50101).
/// </summary>
table 50103 "Posted Nutrition Header"
{
    Caption = 'Posted Nutrition Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Táplálkozási szám';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Vevő';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get(Rec."Customer No.") then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Vevő neve';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Nutrition Date"; Date)
        {
            Caption = 'Dátum';
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum "Nutrition Status")
        {
            Caption = 'Státusz';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(6; "Total Protein"; Decimal)
        {
            Caption = 'Total Protein';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Protein where("Nutrition No." = FIELD("No.")));
        }
        field(7; "Total Fat"; Decimal)
        {
            Caption = 'Total Fat';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Fat where("Nutrition No." = FIELD("No.")));
        }
        field(8; "Total Carbohydrate"; Decimal)
        {
            Caption = 'Total Carbohydrate';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Carbohydrate where("Nutrition No." = FIELD("No.")));
        }
        field(9; "Total KJ"; Integer)
        {
            Caption = 'Total KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".KJ where("Nutrition No." = FIELD("No.")));
        }
        field(10; "Total Kcal"; Integer)
        {
            Caption = 'Total Kcal';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Kcal where("Nutrition No." = FIELD("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
