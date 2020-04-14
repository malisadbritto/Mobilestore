<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Mobile_ShopProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        #main_div {
            margin: auto;
            width: 80%;
        }

        .style6 {
            width: 122px;
        }

        .auto-style1 {
            height: 20px;
            width: 389px;
            text-align: center;
        }

        .auto-style2 {
            width: 389px;
        }

        .auto-style3 {
            width: 389px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row text-center"
        id="main_div">



        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" Height="1241px" Width="1285px">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#8c8c8c" ForeColor="#FFFFFF" Font-Bold="True" />
            <ItemStyle ForeColor="#333333" />

            <ItemTemplate>
                <div class="col-sm-3 col-md-3" style="width: 100%">

                    <div class="thumbnail">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_url") %>' Width="300px" />
                        <div class="caption">
                            <div class="color">

                                <asp:Label ID="lblcolor" runat="server" Text="Color :"></asp:Label>

                                &nbsp;<b><asp:Label ID="lblColordata" runat="server" Text='<%# Eval("Color") %>'></asp:Label></b>
                            </div>

                            <div class="prodname">
                                <asp:Label ID="lblmobilename" runat="server" Text="Mobile Name :"></asp:Label>

                                &nbsp;<b><asp:Label ID="lblnamedata" runat="server" Text='<%# Eval("mobile_name") %>'></asp:Label></b>
                            </div>
                            <div class="proprice">
                                <asp:Label ID="lblprice" runat="server" Text="Price :$"></asp:Label>
                                &nbsp;
                           <b>
                               <asp:Label ID="lblpricedata" runat="server" Text='<%# Eval("Price") %>'></asp:Label></b>
                            </div>
                        </div>
                        <div class="caption">
                        <div class="cpu">
                            <asp:Label ID="lblcpu" runat="server" Text="CPU :"></asp:Label>
                             &nbsp;
                           <b>
                               <asp:Label ID="lblcpudata" runat="server" Text='<%# Eval("Cpu") %>'></asp:Label></b>
                        </div>
                        <div class="memory">
                            <asp:Label ID="lblmemory" runat="server" Text="Memory :"></asp:Label>
                             &nbsp;
                            <b>
                                <asp:Label ID="lblmemorydata" runat="server" Text='<%# Eval("RAM") %>'></asp:Label></b>
                        </div>
                        <div class="display">
                            <asp:Label ID="lbldisplay" runat="server" Text="Display :"></asp:Label>
                             &nbsp;
                            <b>
                                <asp:Label ID="lbldisplaydata" runat="server" Text='<%# Eval("version") %>'></asp:Label></b>
                        </div>




                        <div class="display">
                        <asp:Label ID="lblbattery" runat="server" Text="Battery :"></asp:Label>
                         &nbsp;
                        <b>
                            <asp:Label ID="lblbatterydata" runat="server" Text='<%# Eval("battery") %>'></asp:Label></b>
                            </div>
                        <div>
                        <asp:Label ID="lblwarranty" runat="server" Text="Warranty :"></asp:Label>
                         &nbsp;
                        <b>
                            <asp:Label ID="lblwarrantydata" runat="server" Text='<%# Eval("warranty") %>'></asp:Label></b>
                            </div>
                        <div class="quantity">
                            <asp:Label ID="Label5" runat="server" Text="Quantity :"></asp:Label>
                             &nbsp;
                            <asp:DropDownList ID="ddlquantity" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                            <br />
                        <div class="addcart">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("mobile_id") %>' CommandName="addtocart"  Height="28px" ImageUrl="~/Images/Addcart.png" Width="111px" AlternateText="Add To Cart" />
                        </div>
                            </div>
                    </div>
                </div>
                </div>

            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [mobile_name], [mobile_id], [Cpu], [warranty], [Price], [RAM], [Camera], [image_url], [battery], [Color],[version] FROM [Mobile_description_tbl]"></asp:SqlDataSource>

    </div>
</asp:Content>
