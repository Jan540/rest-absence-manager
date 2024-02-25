using AbscenceManagerService.Models;
using AbsenceLibrary.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AbscenceManagerService.Controllers
{
    [Route("api")]
    [ApiController]
    public class AbscenceController : ControllerBase
    {
        private static AbsenceContext _context = new AbsenceContext();

        [HttpGet("students")]
        public async Task<ActionResult<IEnumerable<Student>>> GetStudents() =>
            Ok(_context.Students.OrderBy(s => s.Lastname).ThenBy(s => s.Firstname));

        [HttpGet("students/{studentId:int}/abscences")]
        public async Task<ActionResult<IEnumerable<Absence>>> GetAbscencesForStudent(int studentId)
        {
            var student = await _context.Students
                .Include(s => s.Absences)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            if (student == null) return NotFound("Student doesn't exist :(");

            return Ok(student.Absences);
        }

        [HttpPost("students/{studentId:int}/abscences")]

        public async Task<ActionResult<Absence>> AddAbscence([FromBody] Absence absence, int studentId)
        {
            var student = await _context.Students.FindAsync(studentId);

            if (student == null) return NotFound("Student doesn't exist :(");

            student.Absences.Add(absence);

            await _context.SaveChangesAsync();

            return Ok(absence);
        }

        [HttpPatch("abscences/{abscenceId:int}")]
        public async Task<ActionResult> UpdateExcused([FromBody] bool excused, int abscenceId)
        {
            var abscence = await _context.Absences.FindAsync(abscenceId);

            if (abscence == null) return NotFound("Abscence does not exist :(");

            abscence.IsExcused = excused;

            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpDelete("abscences/{abscenceId:int}")]
        public async Task<ActionResult> DeleteAbscence(int abscenceId)
        {
            var abscence = await _context.Absences.FindAsync(abscenceId);

            if (abscence == null) return NotFound("Abscence does not exist :(");

            _context.Absences.Remove(abscence);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
