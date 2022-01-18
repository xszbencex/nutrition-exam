/// <summary>
/// PageExtension NutritionSetup (ID 50101) extends Record Sales and Receivables Setup.
/// </summary>
pageextension 50101 NutritionSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Nutrition Nos."; Rec."Nutrition Nos.")
            {
                Caption = 'Nutrition Nos.';
                ApplicationArea = All;
            }
        }
    }
}
