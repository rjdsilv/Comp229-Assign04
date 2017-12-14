using System;
using System.Diagnostics;
using System.Net.Mail;
using System.Net.Mime;

namespace Comp229_Assign04.Helpers
{
    public class EmailHelper
    {
        private const string SENDER_NAME = "Game.Me Web Application";
        private const string SENDER_EMAIL = "cc-comp229f2016@outlook.com";
        private const string SENDER_PASSWD = "comp229pwd";
        private const string EMAIL_SUBJECT = "[Game.Me] - Exported Model File";
        private const string EMAIL_BODY = string.Format("Hi, {0}. Thanks for using the Game.Me Web Application.\n\nThe exported model file you requeste is attached in this email.\n\n\nAll the best.\n\nGame.Me Team", toName);
        private const string SMTP_HOST = "mailserver.example.com";

        /// <summary>
        /// Sends an e-mail with the exported JSON file to the given address.
        /// </summary>
        /// <param name="toAddr">The receiver email address</param>
        /// <param name="toName">The receiver name</param>
        /// <param name="basePath">The JSON file's base path</param>
        public static void SendEmail(string toAddr, string toName, string basePath)
        {
            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();

            try
            {
                // Setting up the e-mail message.
                message.From = new MailAddress(SENDER_EMAIL, SENDER_NAME);
                message.To.Add(new MailAddress(toAddr, toName));
                message.Attachments.Add(new Attachment(JsonHelper.GetFilePath(basePath), MediaTypeNames.Application.Octet));
                message.Subject = EMAIL_SUBJECT;
                message.Body = EMAIL_BODY;

                // Connecting to the SMTP server and sending the e-mail.
                smtpClient.Host = SMTP_HOST;
                smtpClient.Credentials = new System.Net.NetworkCredential(SENDER_NAME, SENDER_PASSWD);
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                // Trace the application error.
                Trace.TraceError(string.Format("The email could not be sent!!! - Exception message {0)", ex.Message));
                Trace.Flush();
            }
        }
    }
}