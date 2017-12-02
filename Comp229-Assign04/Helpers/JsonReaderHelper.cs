using Comp229_Assign04.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;

namespace Comp229_Assign04.Helpers
{
    public class JsonHelper
    {
        // The file location.
        private const string JSON_FILE_NAME = @"Data\Assign04.json";

        // The application logger.
        private static TraceSource TRACE = new TraceSource("ApplicationLogger");

        public static List<Mini> Deserialize(string basePath)
        {
            // Build the file name.
            var filePath = basePath;

            if (filePath.EndsWith("\\"))
            {
                filePath += JSON_FILE_NAME;
            }
            else
            {
                filePath += "\\" + JSON_FILE_NAME;
            }

            if (File.Exists(filePath))
            {
                try
                {
                    // Reads the file and deserialize it into a List of Mini objects.
                    var jsonStr = File.ReadAllText(filePath);
                    return JsonConvert.DeserializeObject<List<Mini>>(jsonStr);
                }
                catch(Exception ex)
                {
                    // If any error occurs, just return an empty list.
                    TRACE.TraceEvent(TraceEventType.Error, 1001, string.Format("The file {0} cannot be used or could not be found!!!", JSON_FILE_NAME));
                    return new List<Mini>();
                }
            }

            // If the file does not exist, just return an empty list.
            TRACE.TraceEvent(TraceEventType.Error, 1002, string.Format("The file {0} could not be found!!!", JSON_FILE_NAME));
            return new List<Mini>();
        }
    }
}