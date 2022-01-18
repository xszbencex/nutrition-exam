/// <summary>
/// Table Nutrition Setup (ID 50105).
/// </summary>
tableextension 50105 "Nutrition Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Nutrition Nos."; Code[20])
        {
            Caption = 'Nutrition Nos.';
            TableRelation = "No. Series";
        }
    }
}
