<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mobile_ShopProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <%--  <div style="text-align: center">
             <hr />
    <asp:Label ID="lblusername" runat="server" Text="UserName: " ForeColor="Black"></asp:Label>
         
    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox><br /><br />

     <asp:Label ID="lblpassword" runat="server" Text="Password: "></asp:Label>
    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
            <hr />
    <asp:Button ID="btn_Login" runat="server" Text="Login" OnClick="btn_Login_Click" />
    <asp:Label ID="lblerror" runat="server" ></asp:Label>
             
              </div>--%>


    <div class="container">
        	<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Login</h1>
						 </div>
					</div>
                   
                           <div class="form-group">
                              <label for="txtusername">UserName</label>
                               <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" aria-describedby="emailHelp" ></asp:TextBox>
                              
                           </div>
                           <div class="form-group">
                              <label for="txtpassword">Password</label>
                                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" aria-describedby="emailHelp"></asp:TextBox>
                             
                           </div>
                           <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                           </div>
                           <div class="col-md-12 text-center ">
                                 <asp:Button ID="btn_Login" runat="server" Text="Login" OnClick="btn_Login_Click" CssClass=" btn btn-block mybtn btn-primary tx-tfm" /><br />
                                <asp:Label ID="lblerror" runat="server" ></asp:Label>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">or</span>
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <p class="text-center">
                                 <a href="javascript:void();" class="google btn mybtn"><i class="fa fa-google-plus">
                                 </i> Signup using Google
                                 </a>
                              </p>
                           </div>
                           <div class="form-group">
                              <p class="text-center">Don't have account? <a href="#" id="signup">Sign up here</a></p>
                           </div>
                        
                 
				</div>
			</div>

    </div>


</asp:Content>

