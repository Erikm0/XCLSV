using xclsvApp.Pages;

namespace xclsvApp.View;

public partial class NavPage : TabbedPage
{
	public NavPage()
	{
		InitializeComponent();
		
		var mainPage = new MainPage();
		var productsPage = new ProductsPage();
		var ordersPage = new OrdersPage();
		var profilePage = new ProfilePage();

        // Kiszedi a vissza gombot az összes oldalról
        NavigationPage.SetHasBackButton(mainPage, false);
        NavigationPage.SetHasBackButton(profilePage, false);
		NavigationPage.SetHasBackButton(ordersPage, false);
        NavigationPage.SetHasBackButton(productsPage, false);

        // Hozzáadja az oldalakat a NavPage-hez, hogy megjelenjenek a TabBarban
        this.Children.Add(mainPage);
		this.Children.Add(productsPage);
        this.Children.Add(ordersPage);
        this.Children.Add(profilePage);
    }
}