using Comp229_Assign04.Helpers;
using Comp229_Assign04.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class Home : Page
    {
        /// <summary>
        /// Loads the page with all the models from the JSON file displaying them as a list.
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Saves the list on a session so it can be serializaed later.
                if (Application["ModelList"] == null)
                {
                    Application["ModelList"] = JsonHelper.Deserialize(Server.MapPath("."));
                }

                DisplayModelList();
            }
        }

        /// <summary>
        /// Add a new model to the existing list of models.
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments.</param>
        protected void AddModelButton_Click(object sender, EventArgs e)
        {
            (Application["ModelList"] as List<Mini>).Add(BuildModelFromInputs());
            DisplayModelList();
            ClearPageTextBoxes(this);
        }

        /// <summary>
        /// Serializes the current list of models and saves it to a JSON file.
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments</param>
        protected void ExportModelsButton_Click(object sender, EventArgs e)
        {
            JsonHelper.Serialize(Server.MapPath("."), Application["ModelList"]);
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
        /// Read all the validated input and transforms the data entered by the user into a model to be put on the list.
        /// </summary>
        /// <returns>The built model.</returns>
        private Mini BuildModelFromInputs()
        {
            // Action fields.
            Models.Action action = new Models.Action();
            action.Name = ModelActionNameTextBox.Text;
            action.Type = ModelActionTypeTextBox.Text;
            action.Rating = uint.Parse(ModelActionRatingTextBox.Text);
            action.Range = ModelActionRangeTextBox.Text;

            if (!string.IsNullOrWhiteSpace(ModelActionDescriptionTextBox.Text))
            {
                action.Description = ModelActionDescriptionTextBox.Text;
            }

            // Special Ability fields.
            SpecialAbility specialAbility = null;
            if (!string.IsNullOrWhiteSpace(ModelSpecialAbilityNameTextBox.Text))
            {
                specialAbility = new SpecialAbility();
                specialAbility.Name = ModelSpecialAbilityNameTextBox.Text;
                if (!string.IsNullOrWhiteSpace(ModelSpecialAbilityDescriptionTextBox.Text))
                {
                    specialAbility.Description = ModelSpecialAbilityDescriptionTextBox.Text;
                }
            }

            // Mini fields.
            Mini mini = new Mini();
            mini.Name = ModelNameTextBox.Text;
            mini.Faction = ModelFactionTextBox.Text;
            mini.Rank = uint.Parse(ModelRankTextBox.Text);
            mini.Base = uint.Parse(ModelBaseTextBox.Text);
            mini.Size = uint.Parse(ModelSizeTextBox.Text);
            mini.DeploymentZone = ModelDeploymentZoneTextBox.Text;
            mini.Mobility = uint.Parse(ModelMobilityTextBox.Text);
            mini.Willpower = uint.Parse(ModelWillPowerTextBox.Text);
            mini.Resiliance = uint.Parse(ModelResilianceTextBox.Text);
            mini.Wounds = uint.Parse(ModelWoundsTextBox.Text);
            mini.Types = new List<string>(ModelTypesTextBox.Text.Split(Mini.SEPARATOR));
            mini.DefenseChart = new List<string>(ModelDefenceChartTextBox.Text.Split(Mini.SEPARATOR));
            mini.ImageUrl = ModelImageUrlTextBox.Text;
            mini.Actions = new List<Models.Action> { action };

            if (null != specialAbility)
            {
                mini.SpecialAbilities = new List<SpecialAbility> { specialAbility };
            }

            if (!string.IsNullOrWhiteSpace(ModelTraitsTextBox.Text))
            {
                mini.Traits = new List<string>(ModelTraitsTextBox.Text.Split(Mini.SEPARATOR));
            }

            return mini;
        }

        /// <summary>
        /// Clears all the text boxes under the given control.
        /// </summary>
        private void ClearPageTextBoxes(Control control)
        {
            foreach(Control currControl in control.Controls)
            {
                if (currControl is TextBox)
                {
                    (currControl as TextBox).Text = "";
                }
                else
                {
                    ClearPageTextBoxes(currControl);
                }
            }
        }
    }
}