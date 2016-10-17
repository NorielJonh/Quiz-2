<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Products_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>View Product #<asp:Literal ID="ltID" runat="server"></asp:Literal></title>

    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />

</head>
<body>
    <div class="container">
        <h1 class="text-left">
            <i class="fa fa-plus">View Product #<asp:Literal ID="ltID2" runat="server"></asp:Literal>
            </i>
        </h1>
        <div class="col-lg-12">
            <div class="well  clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtName" runat="server" class="form-control"
                                    MaxLenght="100" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Category</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlCategory" runat="server"
                                    class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Code</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCode" runat="server"
                                    class="form-control" MaxLength="20" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Description</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtDescription" runat="server"
                                    class="form-control" TextMode="Multiline" MaxLength="300" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Image</label>
                            <div class="col-lg-8">
                                <asp:FileUpload ID="FileImageUpload" runat="server" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Price</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" type="number"
                                    min="0.01" max="500000.00" step="0.01" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Is Featured?</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlIsFeatured" runat="server"
                                    CssClass="form-control">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Critical Level</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCriticallevel" runat="server"
                                    class="form-control" type="number" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Maximum</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMaximum" runat="server"
                                    class="form-control" type="number" required />
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-lg-offset-4 col-lg-8">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success btn-md pull-right"
                                    Text="Update" OnClick="btnUpdate_Click" />
                                <a href="Default.aspx" class="btn btn-danger btn-md pull-left">Cancel
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
