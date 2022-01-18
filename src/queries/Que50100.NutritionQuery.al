/// <summary>
/// Query Nutrition Query (ID 50100).
/// </summary>
query 50100 "Nutrition Query"
{
    Caption = 'Nutrition Query';
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(customerNumber; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            dataitem(Posted_Nutrition_Header; "Posted Nutrition Header")
            {
                DataItemLink = "Customer No." = Customer."No.";
                column(NutritionDate; "Nutrition Date")
                {
                }
                column(TotalProtein; "Total Protein")
                {
                }
                column(TotalFat; "Total Fat")
                {
                }
                column(TotalCarbohydrate; "Total Carbohydrate")
                {
                }
                column(TotalKJ; "Total KJ")
                {
                }
                column(TotalKcal; "Total Kcal")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
