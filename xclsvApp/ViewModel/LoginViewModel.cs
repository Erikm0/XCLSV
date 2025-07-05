using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using xclsvApp.Context;
using xclsvApp.Model;
using xclsvApp.Service;
using xclsvApp.View;
using BCrypt.Net;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace xclsvApp.ViewModel
{
    public partial class LoginViewModel : ObservableObject
    {
        [ObservableProperty]
        private string password;

        private string email;
        public string Email
        {
            get => email;
            set
            {
                email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        private DbService service;

        [ObservableProperty]
        private bool isVisible;

        [ObservableProperty]
        private Color resultColor;

        [ObservableProperty]
        private string resultText;

        private ObservableCollection<AdminModel> admins;

        public LoginViewModel()
        {
            IsVisible = false;
            service = new DbService();
            LoadAdmins();
        }

        private async void LoadAdmins()
        {
            admins = await service.GetAdmins();
        }

        private bool isValidUser(string email, string password)
        {
            
            if (admins != null)
            {
                foreach (var admin in admins)
                {
                    if (admin.Email.ToLower() == email.ToLower() && BCrypt.Net.BCrypt.Verify(password, admin.Password))
                    {
                        return true;
                    }
                }
            }
            return false;
        }


        [RelayCommand]
        public async void Login()
        {
            if (isValidUser(Email, Password))
            {
                ResultText = "Sikeres bejelentkezés!";
                ResultColor = Color.FromRgba(0, 255, 0, 0.5);
                IsVisible = true;

                // task.delay segítségével a program vár, hogy megjelenjen a sikeres bejelentkezés üzenetet
                await Task.Delay(1000);

                await Application.Current.MainPage.Navigation.PushAsync(new NavPage());
            }
            else
            {
                ResultText = "Sikertelen bejelentkezés!";
                ResultColor = Color.FromRgba(255, 0, 0, 0.5);
                IsVisible = true;
                LoadAdmins();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
