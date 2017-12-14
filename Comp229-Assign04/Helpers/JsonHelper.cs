using Comp229_Assign04.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;

namespace Comp229_Assign04.Helpers
{
    /// <summary>
    /// Helper class to deal with JSON Serialization and Deserialization.
    /// </summary>
    public class JsonHelper
    {
        // The file location.
        public const string JSON_FILE_NAME = @"Data\Assign04.json";

        /// <summary>
        /// Deserializes the content from the file contained in JSON_FILE_NAME into a list of Mini objects.
        /// </summary>
        /// <param name="basePath">The JSON file base path.</param>
        /// <returns>The list of Minis if everything is ok. An empty list otherwise.</returns>
        public static List<Mini> Deserialize(string basePath)
        {
            // Build the file name.
            var filePath = GetFilePath(basePath);

            if (File.Exists(filePath))
            {
                try
                {
                    // Reads the file and deserialize it into a List of Mini objects.
                    return JsonConvert.DeserializeObject<List<Mini>>(File.ReadAllText(filePath));
                }
                catch(Exception ex)
                {
                    // If any error occurs, just return an empty list.
                    Trace.TraceError(string.Format("The file {0} cannot be used or could not be found!!! - Exception message {1)", JSON_FILE_NAME, ex.Message));
                    return new List<Mini>();
                }
            }

            // If the file does not exist, just return an empty list.
            Trace.TraceError(string.Format("The file {0} could not be found!!!", JSON_FILE_NAME));
            Trace.Flush();
            return new List<Mini>();
        }

        public static void Serialize(string basePath, object value)
        {
            // Build the file name.
            var filePath = GetFilePath(basePath);

            if (File.Exists(filePath))
            {
                try
                {
                    // Reads the file and deserialize it into a List of Mini objects.
                    string serialized = JsonConvert.SerializeObject(value, Formatting.Indented);
                    File.WriteAllText(filePath, serialized);
                }
                catch (Exception ex)
                {
                    // If any error occurs, just return an empty list.
                    Trace.TraceError(string.Format("The object could not be serialized to the file {0} !!! - Exception message {1)", JSON_FILE_NAME, ex.Message));
                }
            }
        }

        public static string GetFilePath(string basePath)
        {
            return basePath.EndsWith("\\") ? basePath + JSON_FILE_NAME : basePath + "\\" + JSON_FILE_NAME; ;
        }
    }
}