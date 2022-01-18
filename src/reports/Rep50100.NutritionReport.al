/// <summary>
/// Report Nutrition Report (ID 50100).
/// </summary>
report 50100 "Nutrition Report"
{
    ApplicationArea = All;
    Caption = 'Nutrition Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\src\Reports\NutiritonReport.rdl';

    dataset
    {
        dataitem(PostedNutritionHeader; "Posted Nutrition Header")
        {
            column(No; "No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
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
