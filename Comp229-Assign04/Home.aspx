<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Comp229_Assign04.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">
        <div class="model-list-container">
            <asp:Repeater ID="ModelRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-sm-2">
                        <div class="model-outer-border">
                            <div class="model-content">
                                <div class="model-name">
                                    <a href="Model.aspx?model=<%# Eval("Name") %>">
                                        <asp:Label ID="ModelLabel" Text='<%# Eval("Name") %>' runat="server" /></span>
                                    </a>
                                </div>
                                <div class="model-image">
                                    <a href="Model.aspx?model=<%# Eval("Name") %>">
                                        <asp:Image ID="ModelImage" AlternateText='<%# Eval("Name") %>' ImageUrl='<%# Eval("ImageUrl") %>' CssClass="model-image-small" runat="server" ToolTip="Click on the image to see the model details." />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="col-sm-12 model-input-container" style="height: 70px;">
                <asp:Button ID="ExportModelsButton" Text="Export Model List" CssClass="model-input-button" OnClick="ExportModelsButton_Click" runat="server" style="margin-top: 20px;" CausesValidation="false"/>
            </div>
        </div>

        <hr />
        <br />

        <asp:Panel ID="IncludeModelPanel" runat="server" CssClass="model-inclusion-panel">
            <div class="model-inclusion-panel-title">
                <asp:Label Text="Include New Model" runat="server" />
            </div>
            <div class="model-inclusion-panel-container">
                <div class="model-input-container">
                    <%-- First line of inputs --%>
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelNameTextBox"
                            ToolTip="Enter the model name here"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Name" />
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelFactionTextBox"
                            ToolTip="Enter the model faction here"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Faction" />
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="ModelRankTextBox"
                            ToolTip="Enter the model rank here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Rank" />
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="ModelBaseTextBox"
                            ToolTip="Enter the model base here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Base" />
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="ModelSizeTextBox"
                            ToolTip="Enter the model size here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Size" />
                    </div>

                    <%--  Validation for first line of inputs --%>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelNameTextBox_RFV"
                            ControlToValidate="ModelNameTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model name is required"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelFactionTextBox_RFV"
                            ControlToValidate="ModelFactionTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model faction is required"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-2 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelRankTextBox_RFV"
                            ControlToValidate="ModelRankTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model rank is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelRankTextBox_RV"
                            ControlToValidate="ModelRankTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Rank must be >= 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-2 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelBaseTextBox_RFV"
                            ControlToValidate="ModelBaseTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model base is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelBaseTextBox_RV"
                            ControlToValidate="ModelBaseTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Base must be > 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-2 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelSizeTextBox_RFV"
                            ControlToValidate="ModelSizeTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model size is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelSizeTextBox_RV"
                            ControlToValidate="ModelSizeTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Size must be > 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                </div>

                <%-- Second line of inputs --%>
                <div class="model-input-container">
                    <div class="col-sm-2">
                        <asp:TextBox ID="ModelDeploymentZoneTextBox"
                            ToolTip="Enter the model deployment zone here"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Deployment Zone" />
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="ModelTraitsTextBox"
                            ToolTip="Enter the model traits here separated by ,"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="(Optional) Type the Model Traits Separated by ," />
                    </div>
                    <div class="col-sm-5">
                        <asp:TextBox ID="ModelTypesTextBox"
                            ToolTip="Enter the model types here separated by ,"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Type the Model Types Separated by ," />
                    </div>

                    <%--  Validation for second line of inputs --%>
                    <div class="col-sm-7 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelDeploymentZoneTextBox_RFV"
                            ControlToValidate="ModelDeploymentZoneTextBox"
                            Display="Dynamic"
                            ErrorMessage="The deployment zone is required"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-5 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelTypesTextBox_RFV"
                            ControlToValidate="ModelTypesTextBox"
                            Display="Dynamic"
                            ErrorMessage="At least one model type is required"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                </div>

                <%-- Third line of inputs --%>
                <div class="model-input-container">
                    <div class="col-sm-12">
                        <asp:TextBox ID="ModelDefenceChartTextBox"
                            ToolTip="Enter the 10 model defensive habilities here separated by ,"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Type exacly 10 model defensive habilities separated by ," />
                    </div>

                    <%--  Validation for third line of inputs --%>
                    <div class="col-sm-12 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelDefenceChartTextBox_RFV"
                            ControlToValidate="ModelDefenceChartTextBox"
                            Display="Dynamic"
                            ErrorMessage="At least one model type is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="ModelDefenceChartTextBox_REV"
                            ControlToValidate="ModelDefenceChartTextBox"
                            Display="Dynamic"
                            ValidationExpression="^([A-Za-z]+[,]){9}[A-Za-z]+$"
                            ErrorMessage="The defense chart must have 10 defensive abilities separated by ,"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                </div>


                <%-- Fourth line of inputs --%>
                <div class="model-input-container">
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelMobilityTextBox"
                            ToolTip="Enter the mobility here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Mobility" />
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelWillPowerTextBox"
                            ToolTip="Enter the will power here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Will Power" />
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelResilianceTextBox"
                            ToolTip="Enter the resiliance here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Resiliance" />
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="ModelWoundsTextBox"
                            ToolTip="Enter the wounds here"
                            TextMode="Number"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Model Wounds" />
                    </div>

                    <%--  Validation for fourth line of inputs --%>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelMobilityTextBox_RFV"
                            ControlToValidate="ModelMobilityTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model size is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelMobilityTextBox_RV"
                            ControlToValidate="ModelMobilityTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Mobility must be >= 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelWillPowerTextBox_RFV"
                            ControlToValidate="ModelWillPowerTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model size is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelWillPowerTextBox_RV"
                            ControlToValidate="ModelWillPowerTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Will Power must be > 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelResilianceTextBox_RFV"
                            ControlToValidate="ModelResilianceTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model size is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelResilianceTextBox_RV"
                            ControlToValidate="ModelResilianceTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Mobility must be > 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                    <div class="col-sm-3 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelWoundsTextBox_RFV"
                            ControlToValidate="ModelWoundsTextBox"
                            Display="Dynamic"
                            ErrorMessage="Model size is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RangeValidator ID="ModelWoundsTextBox_RV"
                            ControlToValidate="ModelWoundsTextBox"
                            Display="Dynamic"
                            Type="Integer"
                            MinimumValue="1"
                            MaximumValue="20"
                            ErrorMessage="Wounds must be > 1"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                </div>
                
                <%-- Fifth line of inputs --%>
                <div class="model-input-container">
                    <div class="col-sm-12">
                        <asp:TextBox ID="ModelImageUrlTextBox"
                            ToolTip="Enter the image URL here ,"
                            TextMode="SingleLine"
                            CssClass="model-input"
                            runat="server"
                            placeholder="Type the complete Image URL" />
                    </div>

                    <%--  Validation for fifth line of inputs --%>
                    <div class="col-sm-12 model-validator-message-container">
                        <asp:RequiredFieldValidator ID="ModelImageUrlTextBox_RFV"
                            ControlToValidate="ModelImageUrlTextBox"
                            Display="Dynamic"
                            ErrorMessage="At least one model type is required"
                            CssClass="model-input-error"
                            runat="server" />
                        <asp:RegularExpressionValidator
                            ID="ModelImageUrlTextBox_REV"
                            ControlToValidate="ModelImageUrlTextBox"
                            Display="Dynamic"
                            ValidationExpression="^http[s]*:\/\/[A-Za-z0-9\-_]+\.([A-Za-z0-9\-_]+[\.\/])*([A-Za-z0-9\-_])*$"
                            ErrorMessage="The defense chart must have 10 defensive abilities separated by ,"
                            CssClass="model-input-error"
                            runat="server" />
                    </div>
                </div>

                <%-- Action Panel --%>
                <asp:Panel ID="IncludeModelActionSubPanel" runat="server" CssClass="model-inclusion-subpanel">
                    <div class="model-inclusion-subpanel-title">
                        <asp:Label Text="Action" runat="server" />
                    </div>
                    <%-- Action inputs first line --%>
                    <div class="model-input-container">
                        <div class="col-sm-3">
                            <asp:TextBox ID="ModelActionNameTextBox"
                                ToolTip="Enter the action name here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="Action Name" />
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox ID="ModelActionTypeTextBox"
                                ToolTip="Enter the action type here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="Action Type" />
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox ID="ModelActionRatingTextBox"
                                ToolTip="Enter the action rating here"
                                TextMode="Number"
                                CssClass="model-input"
                                runat="server"
                                placeholder="Action Rating" />
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox ID="ModelActionRangeTextBox"
                                ToolTip="Enter the action range here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="Action Range" />
                        </div>

                        <%--  Validation for action inputs first line --%>
                        <div class="col-sm-3 model-validator-message-container">
                            <asp:RequiredFieldValidator ID="ModelActionNameTextBox_RFV"
                                ControlToValidate="ModelActionNameTextBox"
                                Display="Dynamic"
                                ErrorMessage="The action name is required"
                                CssClass="model-input-error"
                                runat="server" />
                        </div>
                        <div class="col-sm-3 model-validator-message-container">
                            <asp:RequiredFieldValidator ID="ModelActionTypeTextBox_RFV"
                                ControlToValidate="ModelActionTypeTextBox"
                                Display="Dynamic"
                                ErrorMessage="The action type is required"
                                CssClass="model-input-error"
                                runat="server" />
                        </div>
                        <div class="col-sm-3 model-validator-message-container">
                            <asp:RequiredFieldValidator ID="ModelActionRatingTextBox_RFV"
                                ControlToValidate="ModelActionRatingTextBox"
                                Display="Dynamic"
                                ErrorMessage="The action range is required"
                                CssClass="model-input-error"
                                runat="server" />
                            <asp:RangeValidator ID="ModelActionRatingTextBox_RV"
                                ControlToValidate="ModelActionRatingTextBox"
                                Display="Dynamic"
                                Type="Integer"
                                MinimumValue="1"
                                MaximumValue="20"
                                ErrorMessage="Action rating must be > 1"
                                CssClass="model-input-error"
                                runat="server" />
                        </div>
                        <div class="col-sm-3 model-validator-message-container">
                            <asp:RequiredFieldValidator ID="ModelActionRangeTextBox_RFV"
                                ControlToValidate="ModelActionRangeTextBox"
                                Display="Dynamic"
                                ErrorMessage="The action range is required"
                                CssClass="model-input-error"
                                runat="server" />
                        </div>
                    </div>

                    <%-- Action inputs second line --%>
                    <div class="model-input-container">
                        <div class="col-sm-12">
                            <asp:TextBox ID="ModelActionDescriptionTextBox"
                                ToolTip="Enter the action description here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="(Optional) Action Description" />
                        </div>
                    </div>
                </asp:Panel>

                <%-- Special Ability panel --%>
                <asp:Panel ID="IncludeModelSpecialAbilitiesSubPanel" runat="server" CssClass="model-inclusion-subpanel">
                    <div class="model-inclusion-subpanel-title">
                        <asp:Label Text="Special Ability" runat="server" />
                    </div>

                    <%-- Special Ability inputs first line --%>
                    <div class="model-input-container">
                        <div class="col-sm-3">
                            <asp:TextBox ID="ModelSpecialAbilityNameTextBox"
                                ToolTip="Enter the special ability name here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="(Optional) Special Ability Name" />
                        </div>
                        <div class="col-sm-9">
                            <asp:TextBox ID="ModelSpecialAbilityDescriptionTextBox"
                                ToolTip="Enter special ability description here"
                                TextMode="SingleLine"
                                CssClass="model-input"
                                runat="server"
                                placeholder="(Optional) Special Ability Description" />
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <div class="col-sm-12 model-input-container" style="height: 50px;">
                <asp:Button ID="AddModelButton" Text="Add Model" CssClass="model-input-button" OnClick="AddModelButton_Click" runat="server" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
