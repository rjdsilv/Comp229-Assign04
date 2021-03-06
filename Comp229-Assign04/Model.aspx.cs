﻿using Comp229_Assign04.Helpers;
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

        /// <summary>
        /// Deletes the model from the list and redirects the user to the Home Page.
        /// </summary>
        /// <param name="sender">The event sender.</param>
        /// <param name="e">The event arguments.</param>
        protected void DeleteModelButton_Click(object sender, EventArgs e)
        {
            (Application["ModelList"] as List<Mini>).Remove(selectedModel);
            Session["RemovedModel"] = selectedModel;
            Response.Redirect("~/Home");
        }

        /// <summary>
        /// Sends the user to an update page to update the model
        /// </summary>
        /// <param name="sender">The event sender.</param>
        /// <param name="e">The event arguments.</param>
        protected void UpdateModelLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("~/Update.aspx?model={0}", selectedModel.Name));
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

        /// <summary>
        /// Gets the model from the model list 
        /// </summary>
        private void SelectModel()
        {
            var modelName = Request.QueryString["model"];
            var modelList = Application["ModelList"] as List<Mini>;

            // Perform a LINQ query to find the model that matches the query string passed.
            if (null != modelList)
            {
                var modelQuery = from model in modelList where model.Name == modelName select model;
                if (modelQuery.Count<Mini>() > 0)
                {
                    selectedModel = modelQuery.First<Mini>();
                }
            }
        }
    }
}