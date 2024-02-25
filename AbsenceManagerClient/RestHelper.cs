using AbsenceLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace AbsenceManagerClient
{
    internal static class RestHelper
    {
        private static HttpClient _httpClient = new()
        {
            BaseAddress = new Uri("http://localhost:5279")
        };


        public static async Task<IEnumerable<Student>?> GetStudentsAsync()
        {
            var res = await _httpClient.GetAsync("api/students");

            if (!res.IsSuccessStatusCode) return null;

            return await res.Content.ReadFromJsonAsync<IEnumerable<Student>>();
        }

        public static async Task<IEnumerable<Absence>?> GetAbsencesAsync(int studentId)
        {
            var res = await _httpClient.GetAsync($"api/students/{studentId}/abscences");

            if (!res.IsSuccessStatusCode) return null;

            return await res.Content.ReadFromJsonAsync<IEnumerable<Absence>>();
        }

        public static async Task<Absence?> PostAbsenceAsync(int studentId, Absence absence)
        {
            var res = await _httpClient.PostAsJsonAsync($"api/students/{studentId}/abscences", absence);

            if (!res.IsSuccessStatusCode) return null;

            return await res.Content.ReadFromJsonAsync<Absence>();
        }

        public static async Task<bool> DeleteAbsenceAsync(int absenceId)
        {
            var res = await _httpClient.DeleteAsync($"api/abscences/{absenceId}");

            return res.IsSuccessStatusCode;
        }

        public static async Task<bool> PatchAbsenceAsync(int absenceId, bool isExcused)
        {
            var content = JsonContent.Create(isExcused);

            var res = await _httpClient.PatchAsync($"api/abscences/{absenceId}", content);

            return res.IsSuccessStatusCode;
        }
    }
}
