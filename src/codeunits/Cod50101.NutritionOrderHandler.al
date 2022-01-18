/// <summary>
/// Codeunit Nutrition Order Handler (ID 50101).
/// </summary>
codeunit 50101 "Nutrition Order Handler"
{
    [EventSubscriber(ObjectType::Page, Page::"Nutrition Order", 'OnBeforeActionEvent', 'CloseStatus', false, false)]
    local procedure OnBeforeActionEvent_CloseStatus(var Rec: Record "Nutrition Header")
    var
        NutritonOrderMgt: Codeunit "Nutrition Order Mgt.";
    begin
        NutritonOrderMgt.CreateMessageBeforeRelease(Rec);
    end;
}
