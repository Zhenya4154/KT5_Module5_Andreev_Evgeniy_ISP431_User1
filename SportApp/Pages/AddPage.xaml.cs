using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SportApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        public Data.Users CurrentUser = new Data.Users();
        public AddPage()
        {
            InitializeComponent();
            RoleComboBox.ItemsSource = Data.User1Entities.GetContext().UserRole.ToList();
            GenderCombobox.ItemsSource = Data.User1Entities.GetContext().UserGender.ToList();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(UserNameTextBox.Text))
                {
                    errors.AppendLine("Введите ФИО");
                }
                if (string.IsNullOrEmpty(NumberPhone.Text))
                {
                    errors.AppendLine("Введите номер телефона");
                }
                if(RoleComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите должность");
                }
                if(GenderCombobox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите пол");
                }
                if(BirthdayDatePicker.SelectedDate == null)
                {
                    errors.AppendLine("Выберите дату рождения");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    errors.AppendLine("Введите почту");
                }
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("Введите логин");
                }
                if (string.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    errors.AppendLine("Введите пароль!");
                }
                if(ConfirmPasswordBox.Password != PasswordTextBox.Password)
                {
                    errors.AppendLine("Пароли не совпадают!");
                }
                if (string.IsNullOrEmpty(ConfirmPasswordBox.Password))
                {
                    errors.AppendLine("Подтвердите пароль");
                }
                if(Data.User1Entities.GetContext().Users.Any(d => d.Login == LoginTextBox.Text))
                {
                    errors.AppendLine("Такой логин уже используется!");
                }
                if (Data.User1Entities.GetContext().Users.Any(d => d.Email == EmailTextBox.Text))
                {
                    errors.AppendLine("Такая почта уже используется!");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                CurrentUser.UserName = UserNameTextBox.Text;
                CurrentUser.NumberPhone = NumberPhone.Text;
                CurrentUser.Email = EmailTextBox.Text;
                CurrentUser.Login = LoginTextBox.Text;
                CurrentUser.Password = PasswordTextBox.Password;
                var RoleSelect = RoleComboBox.SelectedItem as Data.UserRole;
                CurrentUser.IdRole = RoleSelect.Id;
                var GenderSelect = GenderCombobox.SelectedItem as Data.UserGender;
                CurrentUser.IdGender = GenderSelect.Id;
                CurrentUser.BirthdayDate = Convert.ToDateTime(BirthdayDatePicker.SelectedDate);

                Data.User1Entities.GetContext().Users.Add(CurrentUser);
                Data.User1Entities.GetContext().SaveChanges();
                MessageBox.Show("Пользователь успешно добавлен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

            }catch(Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
        }
    }
}
