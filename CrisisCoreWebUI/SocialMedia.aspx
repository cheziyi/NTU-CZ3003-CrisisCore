﻿<%@ Page Title="Update Social Media" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SocialMedia.aspx.cs" Inherits="CrisisCoreWebUI.SocialMedia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Display of success or error message --%>
    <asp:Panel ID="successMsg" class="alert alert-success fade in" runat="server" Visible="false">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong>
        <asp:Literal ID="litMessage" runat="server"></asp:Literal>
    </asp:Panel>
    <div class="row">
        <div class="col-lg-6">
            <%-- Form display for user to input message content to post into social media --%>
            <div class="form-horizontal">
                <fieldset>
                    <legend>Update Social Media</legend>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <label for="lstAreas" class="col-lg-3 control-label">Area:</label>
                                <div class="col-lg-9">
                                    <asp:ListBox ID="lstAreas" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="lstAreas_SelectedIndexChanged"></asp:ListBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lstEmergencies" class="col-lg-3 control-label">Emergencies:</label>
                                <div class="col-lg-9">
                                    <asp:ListBox ID="lstEmergencies" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="lstEmergencies_SelectedIndexChanged"></asp:ListBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtMessage" class="col-lg-3 control-label">Message:</label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtMessage" runat="server" class="form-control" type="number" MaxLength="8" required TextMode="MultiLine" Height="150"></asp:TextBox>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-3">
                            <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
