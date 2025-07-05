
using xclsvApp.Pages;

namespace xclsvApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            MainPage = new NavigationPage(new Login());
        }

        // App elindításnál beállítja az ablak méretét egy fix értékre amit nem lehet módosítani
        protected override Window CreateWindow(IActivationState? activationState)
        {
            var window = base.CreateWindow(activationState);

            int WindowWidth = 900;
            int WindowHeight = 600;

            window.Width = WindowWidth;
            window.Height = WindowHeight;

            return window;
        }
    }
}
