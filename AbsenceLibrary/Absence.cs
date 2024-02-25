using System;

namespace AbsenceLibrary.Models
{
    public partial class Absence
    {
        public Absence()
        {
        }

        public Absence(DateTime from, DateTime to, string reason)
        {
            From = from;
            To = to;
            Reason = reason;
        }


        // uncomment the following code after you have created the Absence entity class

        public DateTime Date => From.Date;
        public string GroupDate => From.ToString("MMM dd");
    }
}
