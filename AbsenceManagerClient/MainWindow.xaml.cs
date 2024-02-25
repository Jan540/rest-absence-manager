using AbsenceLibrary.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.Json;
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

namespace AbsenceManagerClient
{
    public partial class MainWindow : Window
    {
        List<Absence> absences = null;

        // DO NOT TOUCH THIS METHOD
        public MainWindow()
        {
            InitializeComponent();

            DateTime start = ComputeStartTime();
            dpFromDate.SelectedDate = start;
            tbFromTime.Text = $"{start.Hour}:{start.Minute}";
            DateTime end = start.AddMinutes(50);
            dpToDate.SelectedDate = end;
            tbToTime.Text = $"{end.Hour}:{end.Minute}";

            Loaded += MainWindow_Loaded;
        }

        private async void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            // TODO: Load students
            // uncomment the following code after you have implemented the REST API
            // and the GetStudentsAsync method in the RestHelper class

            IEnumerable<Student>? students = await RestHelper.GetStudentsAsync();
            if (students == null)
            {
                tbErrors.Text = "Could not retrieve student data - REST request failed.";
            }
            else
            {
                tbErrors.Text = string.Empty;
                var collectionViewSource = this.FindResource("StudentViewSource") as CollectionViewSource;
                collectionViewSource.Source = students;
            }
        }

        private async void lbStudents_SelectionChangedAsync(object sender, SelectionChangedEventArgs e)
        {
            // TODO: Load absences for the selected student
            // uncomment the following code after you have implemented the REST API
            // and the GetAbsencesAsync method in the RestHelper class

            Student? selectedStudent = lbStudents.SelectedItem as Student;
            if (selectedStudent != null)
            {
                var response = await RestHelper.GetAbsencesAsync(selectedStudent.Id);
                if (response == null)
                {
                    tbErrors.Text = "Could not retrieve absence data for selected student.";
                }
                else
                {
                    absences = response.ToList();
                    var collectionViewSource = this.FindResource("AbsenceViewSource") as CollectionViewSource;
                    collectionViewSource.Source = absences.OrderBy(a => a.From);
                }
            }
        }

        private async void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            // TODO: Add a new absence for the selected student
            // uncomment the following code after you have implemented the REST API
            // and the PostAbsenceAsync method in the RestHelper class

            Student? selectedStudent = lbStudents.SelectedItem as Student;
            if (selectedStudent != null)
            {
                tbErrors.Text = string.Empty;
                var fromDate = dpFromDate.SelectedDate.Value;
                var fromParts = tbFromTime.Text.Trim().Split(':');
                var fromDateTime = new DateTime(fromDate.Year, fromDate.Month, fromDate.Day, int.Parse(fromParts[0]), int.Parse(fromParts[1]), 0);
                var toDate = dpToDate.SelectedDate.Value;
                var toParts = tbToTime.Text.Trim().Split(':');
                var toDateTime = new DateTime(toDate.Year, toDate.Month, toDate.Day, int.Parse(toParts[0]), int.Parse(toParts[1]), 0);
                Absence newAbsence = new Absence(fromDateTime, toDateTime, tbReason.Text);

                Absence? response = await RestHelper.PostAbsenceAsync(selectedStudent.Id, newAbsence);
                if (response == null)
                    tbErrors.Text = "Could not enter new absence";
                else
                {
                    absences.Add(response);
                    var collectionViewSource = this.FindResource("AbsenceViewSource") as CollectionViewSource;
                    collectionViewSource.Source = absences.OrderBy(a => a.From);
                }
            }
            else
            {
                tbErrors.Text = "No student selected";
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            // TODO: Delete the selected absence
            // uncomment the following code after you have implemented the REST API
            // and the DeleteAbsenceAsync method in the RestHelper class

            Absence? selectedAbsence = lbAbsences.SelectedItem as Absence;
            if (selectedAbsence == null)
                tbErrors.Text = "No student or absence selected.";
            else
            {
                tbErrors.Text = string.Empty;
                var success = await RestHelper.DeleteAbsenceAsync(selectedAbsence.Id);
                if (!success)
                    tbErrors.Text = "Could not delete absence.";
                else
                {
                    absences.Remove(selectedAbsence);
                    var collectionViewSource = this.FindResource("AbsenceViewSource") as CollectionViewSource;
                    collectionViewSource.Source = absences.OrderBy(a => a.From);
                }
            }
        }

        private async void btnExcuse_Click(object sender, RoutedEventArgs e)
        {
            // TODO: Excuse the selected absence
            // uncomment the following code after you have implemented the REST API
            // and the PatchAbsenceAsync method in the RestHelper class

            Absence? selectedAbsence = lbAbsences.SelectedItem as Absence;
            if (selectedAbsence == null)
                tbErrors.Text = "No student or absence selected.";
            else
            {
                selectedAbsence.IsExcused = !selectedAbsence.IsExcused;
                tbErrors.Text = string.Empty;

                var success = await RestHelper.PatchAbsenceAsync(selectedAbsence.Id, selectedAbsence.IsExcused);
                if (!success)
                    tbErrors.Text = "Could not excuse absence.";
                else
                {
                    var collectionViewSource = this.FindResource("AbsenceViewSource") as CollectionViewSource;
                    collectionViewSource.Source = absences.OrderBy(a => a.From);
                }
            }
        }

        // DO NOT TOUCH THIS METHOD
        private static DateTime ComputeStartTime()
        {
            DateTime now = DateTime.Now;
            TimeSpan nowTime = now.TimeOfDay;

            if (nowTime < new TimeSpan(8, 40, 0))
                return new DateTime(now.Year, now.Month, now.Day, 7, 50, 0);
            if (nowTime < new TimeSpan(9, 30, 0))
                return new DateTime(now.Year, now.Month, now.Day, 8, 40, 0);
            if (nowTime < new TimeSpan(10, 20, 0))
                return new DateTime(now.Year, now.Month, now.Day, 9, 30, 0);
            if (nowTime < new TimeSpan(11, 20, 0))
                return new DateTime(now.Year, now.Month, now.Day, 10, 30, 0);
            if (nowTime < new TimeSpan(12, 10, 0))
                return new DateTime(now.Year, now.Month, now.Day, 11, 20, 0);
            if (nowTime < new TimeSpan(13, 0, 0))
                return new DateTime(now.Year, now.Month, now.Day, 12, 10, 0);
            if (nowTime < new TimeSpan(13, 50, 0))
                return new DateTime(now.Year, now.Month, now.Day, 13, 0, 0);
            if (nowTime < new TimeSpan(14, 40, 0))
                return new DateTime(now.Year, now.Month, now.Day, 13, 50, 0);
            if (nowTime < new TimeSpan(15, 40, 0))
                return new DateTime(now.Year, now.Month, now.Day, 14, 50, 0);
            if (nowTime < new TimeSpan(16, 30, 0))
                return new DateTime(now.Year, now.Month, now.Day, 15, 40, 0);

            return new DateTime(now.Year, now.Month, now.Day, 7, 50, 0).AddDays(1);
        }
    }
}
