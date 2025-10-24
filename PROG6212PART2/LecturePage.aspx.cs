using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG6212PART2
{
    public partial class LecturePage : System.Web.UI.Page
    {
        // In-memory list to simulate data storage
        protected static List<Claim> claims = new List<Claim>();

        protected void Page_Load(object sender, EventArgs e)
        {
            string lectureCode = Request.QueryString["lectureCode"];

            if (!IsPostBack)
            {
                LoadClaims(lectureCode);
                BindClaimsToGrid();
                BindClaimsToDiv();
            }
        }

        private void LoadClaims(string lectureCode)
        {
            // Simulate data loading if empty
            if (!claims.Any())
            {
                claims.Add(new Claim
                {
                    Id = 1,
                    LectureName = "Intro to Programming",
                    ModuleName = "Module 1",
                    ProgramName = "Computer Science",
                    Date = DateTime.Parse("2023-09-15"),
                    HourlyRate = 50,
                    Tasks = "Lecture Delivery",
                    Hours = 2,
                    Document = "claim1.pdf",
                    Status = "Pending",
                    LectureCode = lectureCode
                });
                claims.Add(new Claim
                {
                    Id = 2,
                    LectureName = "Advanced Topics",
                    ModuleName = "Module 2",
                    ProgramName = "Computer Science",
                    Date = DateTime.Parse("2023-09-16"),
                    HourlyRate = 55,
                    Tasks = "Lab Supervision",
                    Hours = 3,
                    Document = "claim2.pdf",
                    Status = "Approved",
                    LectureCode = lectureCode
                });
            }
        }

        private void BindClaimsToGrid()
        {
            var lectureCode = Request.QueryString["lectureCode"];
            var filteredClaims = claims.Where(c => c.LectureCode == lectureCode).ToList();
           
        }

        private void BindClaimsToDiv()
        {
            var lectureCode = Request.QueryString["lectureCode"];
            var filteredClaims = claims.Where(c => c.LectureCode == lectureCode).ToList();

            

            foreach (var c in filteredClaims)
            {
                // Container div
                var div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                div.Attributes["class"] = "claim";

                // Claim info
                div.InnerHtml = $@"
                    <strong>Claim ID:</strong> {c.Id}<br />
                    <strong>Lecture Name:</strong> {c.LectureName}<br />
                    <strong>Module Name:</strong> {c.ModuleName}<br />
                    <strong>Program Name:</strong> {c.ProgramName}<br />
                    <strong>Date:</strong> {c.Date.ToShortDateString()}<br />
                    <strong>Hourly Rate:</strong> {c.HourlyRate}<br />
                    <strong>Tasks:</strong> {c.Tasks}<br />
                    <strong>Hours:</strong> {c.Hours}<br />
                    <strong>Document:</strong> {c.Document}<br />
                    <strong>Status:</strong> <span id='status-{c.Id}'>{c.Status}</span><br />
                ";

                // Approve button
                var btnApprove = new Button
                {
                    Text = "Approve",
                    CommandArgument = c.Id.ToString(),
                    CssClass = "btn btn-success"
                };
                btnApprove.Click += (s, e) => {
                    c.Status = "Approved";
                    BindClaimsToGrid();
                    BindClaimsToDiv();
                };

                // Reject button
                var btnReject = new Button
                {
                    Text = "Reject",
                    CommandArgument = c.Id.ToString(),
                    CssClass = "btn btn-danger"
                };
                btnReject.Click += (s, e) => {
                    c.Status = "Rejected";
                    BindClaimsToGrid();
                    BindClaimsToDiv();
                };

                // Add buttons
                div.Controls.Add(btnApprove);
                div.Controls.Add(new LiteralControl("&nbsp;")); // space
                div.Controls.Add(btnReject);

               ;
            }
        }
    }

    public class Claim
    {
        public int Id { get; set; }
        public string LectureName { get; set; }
        public string ModuleName { get; set; }
        public string ProgramName { get; set; }
        public DateTime Date { get; set; }
        public decimal HourlyRate { get; set; }
        public string Tasks { get; set; }
        public int Hours { get; set; }
        public string Document { get; set; }
        public string Status { get; set; }
        public string LectureCode { get; set; }
    }
}