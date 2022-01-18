/// <summary>
/// XmlPort Nutrition List Export (ID 50100).
/// </summary>
xmlport 50100 "Nutrition List Export"
{
    Caption = 'Nutrition List Export';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(NutritionHeader; "Nutrition Header")
            {
                fieldelement(No; NutritionHeader."No.")
                {
                }
                fieldelement(CustomerNo; NutritionHeader."Customer No.")
                {
                }
                fieldelement(CustomerName; NutritionHeader."Customer Name")
                {
                }
                fieldelement(NutritionDate; NutritionHeader."Nutrition Date")
                {
                }
                fieldelement(TotalProtein; NutritionHeader."Total Protein")
                {
                }
                fieldelement(TotalFat; NutritionHeader."Total Fat")
                {
                }
                fieldelement(TotalCarbohydrate; NutritionHeader."Total Carbohydrate")
                {
                }
                fieldelement(TotalKJ; NutritionHeader."Total KJ")
                {
                }
                fieldelement(TotalKcal; NutritionHeader."Total Kcal")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
