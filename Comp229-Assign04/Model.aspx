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
                        <div class="col-sm-8 model-detail-name-faction-right">
                            <span class="model-detail-name-text"><%= selectedModel.Name %></span>
                            <br />
                            <span class="model-detail-faction-text"><%= selectedModel.Faction %></span>
                        </div>
                        <div class="col-sm-4 model-detail-defence-chart">
                            &nbsp;
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</asp:Content>
