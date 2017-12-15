using Comp229_Assign04.Helpers;
using Comp229_Assign04.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Comp229_Assign04
{
    public partial class Model : System.Web.UI.Page
    {
        protected Mini selectedModel;

        protected string message;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Saves the list on a session so it can be serializaed later.
                if (Application["ModelList"] == null)
                {
                    Application["ModelList"] = JsonHelper.Deserialize(Server.MapPath("."));
                }

                // Only displays the model list if coming directly to this page.
                if (string.IsNullOrWhiteSpace(Request.QueryString["model"]))
                {
                    DisplayModelList();
                }
                else
                {
                    SelectModel();
                }
            }
        }

        /// <summary>
        /// Displays the model list on the user's screen..
        /// </summary>
        private void DisplayModelList()
        {
            // Display all the models.
            ModelRepeater.DataSource = Application["ModelList"];
            ModelRepeater.DataBind();
        }

        private void SelectModel()
        {
            var modelName = Request.QueryString["model"];
            var modelList = Application["ModelList"] as List<Mini>;

            // Perform a LINQ query to find the model that matches the query string passed.
            if (null != modelList)
            {
                var modelQuery = from model in modelList where model.Name == modelName select model;
                selectedModel = modelQuery.First<Mini>();
            }
        }
    }
}