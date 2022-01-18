/// <summary>
/// Enum Nutrition Status (ID 50100).
/// </summary>
enum 50100 "Nutrition Status"
{
    Extensible = true;

    value(0; Opened)
    {
        Caption = 'Nyitott';
    }
    value(1; Closed)
    {
        Caption = 'Zárt';
    }
}
