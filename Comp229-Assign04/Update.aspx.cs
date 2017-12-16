using Comp229_Assign04.Helpers;
using Comp229_Assign04.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Comp229_Assign04
{
    public partial class Update : System.Web.UI.Page
    {
        protected Mini selectedModel;

        protected string message;

        /// <summary>
        /// Loads the text boxes with the current model value for being updated.
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments</param>
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
                FillTextBoxes();
            }
        }

        /// <summary>
        /// Updates the model with the given values.
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments</param>
        protected void UpdateModelButton_Click(object sender, EventArgs e)
        {
            if (null != selectedModel)
            {
                // Updates the model.
                selectedModel.Faction = ModelFactionTextBox.Text;
                selectedModel.Rank = uint.Parse(ModelRankTextBox.Text);
                selectedModel.Base = uint.Parse(ModelBaseTextBox.Text);
                selectedModel.Size = uint.Parse(ModelSizeTextBox.Text);
                selectedModel.DeploymentZone = ModelDeploymentZoneTextBox.Text;
                selectedModel.Mobility = uint.Parse(ModelMobilityTextBox.Text);
                selectedModel.Willpower = uint.Parse(ModelWillPowerTextBox.Text);
                selectedModel.Resiliance = uint.Parse(ModelResilianceTextBox.Text);
                selectedModel.Wounds = uint.Parse(ModelWoundsTextBox.Text);
                selectedModel.Types = new List<string>(ModelTypesTextBox.Text.Split(Mini.SEPARATOR));
                selectedModel.DefenseChart = new List<string>(ModelDefenceChartTextBox.Text.Split(Mini.SEPARATOR));
                selectedModel.ImageUrl = ModelImageUrlTextBox.Text;

                if (!string.IsNullOrWhiteSpace(ModelTraitsTextBox.Text))
                {
                    selectedModel.Traits = new List<string>(ModelTraitsTextBox.Text.Split(Mini.SEPARATOR));
                }

                ShowSuccessMessage(string.Format("Model {0} updated successfully!", selectedModel.Name));
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

        /// <summary>
        /// Fills all the text boxes with the model existing values.
        /// </summary>
        private void FillTextBoxes()
        {
            if (!IsPostBack)
            {
                if (null != selectedModel)
                {
                    // Populate the common attributes.
                    ModelNameTextBox.Text = selectedModel.Name;
                    ModelFactionTextBox.Text = selectedModel.Faction;
                    ModelRankTextBox.Text = selectedModel.Rank.ToString();
                    ModelBaseTextBox.Text = selectedModel.Base.ToString();
                    ModelSizeTextBox.Text = selectedModel.Size.ToString();
                    ModelDeploymentZoneTextBox.Text = selectedModel.DeploymentZone;
                    ModelMobilityTextBox.Text = selectedModel.Mobility.ToString();
                    ModelWillPowerTextBox.Text = selectedModel.Willpower.ToString();
                    ModelResilianceTextBox.Text = selectedModel.Resiliance.ToString();
                    ModelWoundsTextBox.Text = selectedModel.Wounds.ToString();
                    ModelImageUrlTextBox.Text = selectedModel.ImageUrl;

                    // Populate the list of string attributes.
                    ModelTraitsTextBox.Text = CreateCommaSeparatedStringFromStringList(selectedModel.Traits);
                    ModelTypesTextBox.Text = CreateCommaSeparatedStringFromStringList(selectedModel.Types);
                    ModelDefenceChartTextBox.Text = CreateCommaSeparatedStringFromStringList(selectedModel.DefenseChart);
                }
                else
                {
                    ShowErrorMessage(string.Format("Can't update the model {0} as it seems to be have been removed by another user!", Request.QueryString["model"]));
                }
            }
        }

        /// <summary>
        /// Creates a comma separated string containing all the members of the given list of strings.
        /// </summary>
        /// <param name="listOfStrings">The given list of strings</param>
        /// <returns>The comma separated string. An empty string if the listOfString is null or empty.</returns>
        private string CreateCommaSeparatedStringFromStringList(List<string> listOfStrings)
        {
            if (null != listOfStrings)
            {
                string commaSeparatedString = "";
                foreach (string listItem in listOfStrings)
                {
                    commaSeparatedString += listItem + ",";
                }
                return commaSeparatedString.Substring(0, commaSeparatedString.Length - 1);
            }

            return "";
        }

        /// <summary>
        /// Shows to the user any unexpecte error that may occur during the database communication.
        /// </summary>
        /// <param name="message">The error message to be shown.</param>
        private void ShowErrorMessage(string message)
        {
            this.message = string.Format("<hr/>The following unexpected error has occurred: <b>{0}</b><hr/>", message);
            ErrorPanel.CssClass = "model-error-message";
        }

        /// <summary>
        /// Shows to the user any unexpecte error that may occur during the database communication.
        /// </summary>
        /// <param name="message">The error message to be shown.</param>
        private void ShowSuccessMessage(string message)
        {
            this.message = string.Format("<hr/>{0}<hr/>", message);
            SuccessPanel.CssClass = "model-success-message";
        }
    }
}