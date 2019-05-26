<%@ Page Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="DevolucionFRM.aspx.cs" Inherits="SitioWEB.Informes.DevolucionFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Realizar reserva</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col text-center">
            <h2 class="text-dark">Devolver vehículo</h2>
        </div>
    </div>
    <div class="row justify-content-center mt-2">
            <div class="col-auto">
                 <div class="input-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="txtCodigoReserva"><i class="fas fa-code mr-2"></i>Codigo de reserva</label>
                        </div>
                        <asp:TextBox ID="txtCodigoReserva" CssClass="form-control" runat="server" placeholder="Ingrese el codigo"></asp:TextBox>                                    
                    </div>
                </div>
            </div>
            <div class="col-auto">
                 <div class="input-group">
                    <div class="input-group-prepend">
                            <label class="input-group-text"><i class="fas fa-tachometer-alt"></i></label>
                    </div>
                    <asp:TextBox ID="txtKMFinal" runat="server" Type="number" CssClass="form-control" placeholder="Kilometraje Final"></asp:TextBox>
                    <div class="input-group-append">
                        <label class="input-group-text">KM</label>
                    </div>
                </div>
            </div>
            <div class="col-auto">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="txtCodigoReserva"><i class="fas fa-money-bill-alt mr-2"></i>Multa</label>
                        </div>
                        <asp:TextBox ID="txtMulta" CssClass="form-control" Type="number" runat="server" placeholder="Ingrese la multa"></asp:TextBox>                                    
                    </div>
            </div>
        </div>
    <div class="row mt-4">
        <div class="col-11">
            <asp:Label Text="Descripción entrega" runat="server" />
            <asp:TextBox ID="txtDescripcionEntrega" Type="textarea" CssClass="form-control" TextMode="MultiLine" Style="height: 40vh"  placeholder="Ingrese las observaciones de la devolución del vehículo"  runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col-11">
            <asp:Button ID="btnDevolverVehiculo" runat="server" Text="Devolver vehiculo" CssClass="btn btn-secondary btn-block" OnClick="btnDevolverVehiculo_Click" />
        </div>
    </div>
      <div class="row mt-2 justify-content-center">
        <div class="col-8">
            <asp:Label ID="lblError" runat="server" CssClass="text-success font-weight-bold" Style="font-size: 22px;" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
