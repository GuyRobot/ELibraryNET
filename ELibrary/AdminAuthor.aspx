﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAuthor.aspx.cs" Inherits="ELibrary.AdminAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        $(document).ready(function () {
            // ReSharper disable UseOfImplicitGlobalInFunctionScope
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="flex px-8 space-x-8">
            <%-- Left Panel --%>
            <div class="w-5/12">

                <%--  --%>
                <div class="px-8 py-4 border shadow rounded-md">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4 class="text-3xl font-extrabold">Author Details</h4>
                            </div>
                        </div>

                        <div class="flex">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img src="Assets/Images/book.png" alt="Author Image" width="64" />
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex space-x-3 mt-4">
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">ID </label>
                                <div class="flex space-x-2">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextAuthorIDBox" runat="server"
                                        placeholder="ID">
                                    </asp:TextBox>
                                    <asp:Button ID="GoButton" CssClass="cursor-pointer mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" OnClick="ButtonGo_Click" runat="server" Text="Go" />
                                </div>
                            </div>
                            <div class="w-8/12">
                                <label class="block text-sm font-medium text-gray-700">Name </label>
                                <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextAdminNameBox" runat="server"
                                    placeholder="Admin Name">
                                </asp:TextBox>
                            </div>
                        </div>

                        <%-- Button Control --%>

                        <div class="flex mt-4 justify-between w-full">
                            <div class="">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="AddButton"
                                    runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                            </div>
                            <div class="">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="UpdateButton"
                                    runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                            </div>
                            <div class="">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="DeleteButton"
                                    runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="text-indigo-600 mt-2 block">Back</a>
            </div>

            <%-- Right Panel --%>
            <div class="w-7/12">

                <%--  --%>
                <div class="shadow px-6 py-4 border">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4 class="text-3xl font-extrabold">Author List</h4>
                                </div>
                            </div>
                        </div>

                        <div class="flex mt-3">
                            <asp:SqlDataSource ID="SqlDataAdminAuthorSource" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="w-full text-center table-bordered table table-striped" ID="GridAdminAuthorDataView" runat="server" DataSourceID="SqlDataAdminAuthorSource" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
