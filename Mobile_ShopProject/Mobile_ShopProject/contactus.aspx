<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Mobile_ShopProject.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container contact-form">


        <h3>Contact Customer Service</h3>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                 
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name *" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                </div>
                <div class="form-group">
                   
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email *" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
                </div>
                <div class="form-group">
                 
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Your Phone Number *" OnTextChanged="txtPhone_TextChanged"></asp:TextBox>
                </div>
                <div class="form-group">
                   
                    <asp:TextBox ID="txtmobilename" runat="server" CssClass="form-control" placeholder="Your Mobile Name and ID  *"></asp:TextBox>
                </div>
                <div class="form-group">
                  
                    <asp:Button ID="btn_contact" runat="server" CssClass="btn btn-primary mb1 black bg-gray" Text="Send Message" OnClick="btn_contact_Click" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                 
                    <asp:TextBox ID="txtissue" runat="server" CssClass="form-control" placeholder="Your Issue *" Height="150px" OnTextChanged="txtissue_TextChanged"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col-md-12">
                <div class="form-group">
                    <h2><asp:Label ID="lblMessage" runat="server" ForeColor="#8c8c8c"></asp:Label></h2>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
