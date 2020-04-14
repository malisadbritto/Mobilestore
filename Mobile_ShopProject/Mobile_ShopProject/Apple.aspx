<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/Site.Master" CodeBehind="Apple.aspx.cs" Inherits="Mobile_ShopProject.Category.Apple" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  GridLines="None" CellPadding="5"  CssClass="table table-bordered table-striped table-condensed" OnRowCommand="GridView1_RowCommand" >
            <HeaderStyle HorizontalAlign="Left" BackColor="#8c8c8c" ForeColor="#FFFFFF" />
          <Columns>
            
             <asp:ImageField DataImageUrlField="image_url" HeaderText="Image"  ControlStyle-Width="80" ControlStyle-Height = "150"> 
                <ControlStyle Height="300px" Width="200px"></ControlStyle>
             </asp:ImageField>
             <asp:BoundField HeaderText="Device"  DataField="mobile_id"  /> 
             <asp:BoundField HeaderText="Device"  DataField="mobile_name"  />          
             <asp:BoundField HeaderText="Cpu"   DataField="Cpu"/>
             <asp:BoundField HeaderText="Price"  DataField="Price" />
             <asp:BoundField HeaderText="Ram"  DataField="Ram"  />
             <asp:BoundField HeaderText="Camera"  DataField="Camera" />
             <asp:BoundField HeaderText="version"  DataField="version"/>
              <asp:TemplateField HeaderText = "Quantity">
                <ItemTemplate>
                    <asp:Label ID="lblquantity" runat="server"/>
                    <asp:DropDownList ID="ddlquantity" runat="server" Height="23px" Width="92px">
                        <asp:ListItem Text ="1" Value="1">1</asp:ListItem>
                        <asp:ListItem Text ="2" Value="2">2</asp:ListItem>
                        <asp:ListItem Text ="3" Value="3">3</asp:ListItem>
                        <asp:ListItem Text ="4" Value="4">4</asp:ListItem>
                        <asp:ListItem Text ="5" Value="5">5</asp:ListItem>
                        <asp:ListItem Text ="6" Value="6">6</asp:ListItem>
                        <asp:ListItem Text ="7" Value="7">7</asp:ListItem>
                        <asp:ListItem Text ="8" Value="8">8</asp:ListItem>
                        <asp:ListItem Text ="9" Value="9">9</asp:ListItem>
                        <asp:ListItem Text ="10" Value="10">10</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
          <%--  <asp:hyperlinkfield text="BuyNow" datanavigateurlfields="mobile_id" datanavigateurlformatstring="orders.aspx?mobile_id={0}">
               <ControlStyle BackColor="Black" ForeColor="White" />
               <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
               <ItemStyle ForeColor="White" HorizontalAlign="Center" />
               </asp:hyperlinkfield>--%>

            
             <asp:ButtonField CommandName="buynow" Text="Buy Now" >

            
             <ControlStyle CssClass="btn btn-primary mb1 black bg-gray" />
             </asp:ButtonField>

            
         </Columns>
          
         
          <HeaderStyle Font-Size="Large" />

         
    </asp:GridView>

    

    
    
    
      

    

    
    
    
</asp:Content>
