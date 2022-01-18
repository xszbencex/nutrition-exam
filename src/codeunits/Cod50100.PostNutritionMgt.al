/// <summary>
/// Codeunit Post Nutrition Mgt. (ID 50100).
/// </summary>
codeunit 50100 "Post Nutrition Mgt."
{
    /// <summary>
    /// PostNutrition.
    /// </summary>
    /// <param name="Nutrition">VAR Record "Nutrition Header".</param>
    procedure PostNutrition(var Nutrition: Record "Nutrition Header")
    var
        PostedNutrientHeader: Record "Posted Nutrition Header";
        PostedNutrientLine: Record "Posted Nutrition Line";
        NutritionLine: Record "Nutrition Line";
        QuestionLabel: Label 'Biztosan törli a nyitott %1 táplálkozást?';
    begin
        Nutrition.TestField(Status, Nutrition.Status::Closed);

        PostedNutrientHeader.Init();
        PostedNutrientHeader.TransferFields(Nutrition);
        PostedNutrientHeader.Insert();

        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", Nutrition."No.");
        NutritionLine.SetFilter(Quantity, '>0');
        if NutritionLine.FindSet() then
            repeat
                PostedNutrientLine.Init();
                PostedNutrientLine.TransferFields(NutritionLine);
                PostedNutrientLine.Insert();
            until NutritionLine.Next() = 0;


        if Confirm(QuestionLabel, true, Nutrition."No.") then
            Nutrition.Delete(true);

        Commit();
        Page.RunModal(Page::"Posted Nutrition Order", PostedNutrientHeader);
    end;


}
