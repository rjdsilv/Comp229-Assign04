<%@ Page Title="Model Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Model.aspx.cs" Inherits="Comp229_Assign04.Model" %>
<asp:Content ID="ModelContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">
        <%-- Error Panel --%>
        <asp:Panel ID="ErrorPanel" runat="server" CssClass="model-error-message-hidden">
            <div><%= message %></div>
        </asp:Panel>

        <%-- Student success message panel --%>
        <asp:Panel ID="SuccessPanel" runat="server" CssClass="model-success-message-hidden">
            <div><%= message %></div>
        </asp:Panel>

        <%-- Model Details --%>
        <div class="model-list-container">
            <% if (string.IsNullOrWhiteSpace(Request.QueryString["model"])) { %>
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
                                            <asp:Image ID="ModelImage"
                                                    AlternateText='<%# Eval("Name") %>'
                                                ImageUrl='<%# Eval("ImageUrl") %>'
                                                CssClass="model-image-small"
                                                runat="server"
                                                ToolTip="Click on the image to see the model details." />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            <% } else if (null != selectedModel) { %>
                <div class="model-detail-container">
                    <div class="col-sm-6 model-detail-left">
                        <div class="col-sm-8 model-detail-name-faction">
                            <span class="model-detail-name-text"><%= selectedModel.Name %></span>
                            <br />
                            <span class="model-detail-faction-text"><%= selectedModel.Faction %></span>
                        </div>
                        <div class="col-sm-4 model-detail-defence-chart">
                            &nbsp;
                        </div>
                        <div class="col-sm-8 model-detail-image-container">
                            <img alt="<%= selectedModel.Name %>" src="<%= selectedModel.ImageUrl %>" class="model-detail-image"/>
                            <div class="col-sm-12 model-physical-attributes">
                                <div class="model-physical-attributes-header">
                                    Mobility
                                </div>
                                <div class="model-physical-attributes-header">
                                    Willpower
                                </div>
                                <div class="model-physical-attributes-header">
                                    Resiliance
                                </div>
                                <div class="model-physical-attributes-header">
                                    Wounds
                                </div>
                                
                                <div class="model-physical-attributes-value">
                                    <span><%=selectedModel.Mobility %></span>
                                </div>
                                <div class="model-physical-attributes-value">
                                    <span><%=selectedModel.Willpower%></span>
                                </div>
                                <div class="model-physical-attributes-value">
                                    <span><%=selectedModel.Resiliance %></span>
                                </div>
                                <div class="model-physical-attributes-value">
                                    <span><%=selectedModel.Wounds %></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 model-detail-defence-chart-container">
                            <ul class="model-defence-list">
                                <% for (var i = 0; i < selectedModel.DefenseChart.Count; i++) { %>
                                    <li class="model-defence-item">
                                        <div class="model-defence-index-container">
                                            <span class="model-defence-index"><%= 10 - i %></span>
                                        </div>
                                        <div class="model-defence-name-container">
                                            <span class="model-defence-name"><%= selectedModel.DefenseChart[i].ToLower() %></span>
                                        </div>
                                    </li>
                                <% } %>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6 model-detail-right">
                        <div class="col-sm-12" style="overflow: auto">
                            <div class="col-sm-8 model-detail-name-faction-right">
                                <span class="model-detail-name-text"><%= selectedModel.Name %></span>
                                <br />
                                <span class="model-detail-faction-text"><%= selectedModel.Faction %></span>
                                <div class="model-detail-trait-type">
                                    <span class="model-detail-trait-type-text" style="font-size: 25pt;">.</span>
                                    <% if (null != selectedModel.Traits) { %>
                                        <% foreach (string trait in selectedModel.Traits) { %>
                                            <span class="model-detail-trait-type-text">
                                                <%= trait %>
                                            </span>
                                            <span class="model-detail-trait-type-text" style="font-size: 25pt;">.</span>
                                        <% } %>
                                    <% } %>

                                    <% if (null != selectedModel.Types) { %>
                                        <% foreach (string type in selectedModel.Types) { %>
                                            <span class="model-detail-trait-type-text">
                                                <%= type %>
                                            </span>
                                        <% } %>
                                    <% } %>
                                    <span class="model-detail-trait-type-text" style="font-size: 25pt;">.</span>
                                </div>
                            </div>
                            <div class="col-sm-4 model-detail-soft-abilities">
                                <div class="model-detail-soft-abilities-left">
                                    Rank
                                </div>
                                <div class="model-detail-soft-abilities-right">
                                    <%= selectedModel.Rank %>
                                </div>

                                <div class="model-detail-soft-abilities-left">
                                    Base
                                </div>
                                <div class="model-detail-soft-abilities-right">
                                    <%= selectedModel.Base %>
                                </div>

                                <div class="model-detail-soft-abilities-left">
                                    Size
                                </div>
                                <div class="model-detail-soft-abilities-right">
                                    <%= selectedModel.Size %>
                                </div>

                                <div class="model-detail-soft-abilities-left">
                                    D. Z.
                                </div>
                                <div class="model-detail-soft-abilities-right">
                                    <%= selectedModel.DeploymentZone %>
                                </div>
                            </div>
                        </div>
                        <% foreach (Comp229_Assign04.Models.Action action in selectedModel.Actions) { %>
                            <div class="col-sm-12">
                                <div class="model-action-container">
                                    <div class="model-action-header">
                                        <%= action.Name %>
                                    </div>
                                    <div class="model-action-content">
                                        <div class="model-action-content-attributes">
                                            <div class="col-sm-6"><%= action.Name %></div>
                                            <div class="col-sm-3"><%= action.Rating %></div>
                                            <div class="col-sm-3"><%= action.Range %></div>
                                        </div>
                                        <% if (!string.IsNullOrWhiteSpace(action.Description)) { %>
                                            <div class="col-sm-12 model-action-content-description">
                                                <%= action.Description %>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        <% } %>

                        <% if (null != selectedModel.SpecialAbilities) { %>
                            <div class="col-sm-12">
                                <div class="model-action-container">
                                    <div class="model-ability-header">
                                        Special Abilities
                                    </div>
                                    <div class="col-sm-12 model-ability-content">
                                        <% foreach (Comp229_Assign04.Models.SpecialAbility ability in selectedModel.SpecialAbilities) { %>
                                            <div>
                                                <b><%= ability.Name %></b>
                                                <% if (!string.IsNullOrWhiteSpace(ability.Description)) { %>
                                                    <b>: </b><%= ability.Description %>
                                                <% } %>
                                            </div>
                                            <br />
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
                <hr />
                <div class="model-buttons-container">
                    <asp:LinkButton ID="UpdateModelLinkButton" CssClass="model-input-button" Text="Update Model" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="DeleteModelButton" CssClass="model-input-button" Text="Delete Model" runat="server" OnClick="DeleteModelButton_Click" />
                </div>
            <% } %>
        </div>
    </div>
</asp:Content>
