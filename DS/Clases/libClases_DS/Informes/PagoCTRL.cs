using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;


namespace libClases_DS.Informes
{
    public class PagoCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdInformePagos { get; set; }
        public string error { get; private set; }
        public string parametroBusqueda { get; set; }
        public string parametroFechaInicial { get; set; }
        public string parametroFechaFinal { get; set; }
        public DropDownList cboCliente { get; set; }
        
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdInformePagos == null)
            {
                error = "No definió el grid del informe de pagos";
                return false;
            }
            SQL = "SP_Consultar_Pago";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformePagos;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformePagos = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }



        public bool LlenarGridPorCriterio()
        {
            if (grdInformePagos == null)
            {
                error = "No definió el grid del informe de pagos";
                return false;

            }
            SQL = "SP_Consultar_PagoXCriterio";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdInformePagos;
            oGrid.AgregarParametro("@parametro_busqueda", parametroBusqueda);
            oGrid.AgregarParametro("@fecha_inicial", parametroFechaInicial);
            oGrid.AgregarParametro("@fecha_final", parametroFechaFinal);
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdInformePagos = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        //public bool LlenarGridPorFechas()
        //{
        //    if (grdInformePagos == null)
        //    {
        //        error = "No definió el grid del informe de pagos";
        //        return false;

        //    }
        //    SQL = "SP_Consultar_PagoXCriterio";
        //    clsGrid oGrid = new clsGrid();
        //    oGrid.SQL = SQL;
        //    oGrid.gridGenerico = grdInformePagos;
        //    oGrid.AgregarParametro("@parametro_busqueda", parametroBusqueda);
        //    oGrid.StoredProcedure = true;
        //    if (oGrid.LlenarGridWeb())
        //    {
        //        grdInformePagos = oGrid.gridGenerico;
        //        oGrid = null;
        //        return true;
        //    }
        //    else
        //    {
        //        error = oGrid.Error;
        //        oGrid = null;
        //        return false;
        //    }
        //}

        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboCliente == null)
            {
                error = "No definió el combo de cliente";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "Clientes_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Valor";
            oCombo.cboGenericoWeb = cboCliente;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboCliente = oCombo.cboGenericoWeb;
                oCombo = null;
                return true;
            }
            else
            {
                //Lee el error, libera memoria y retorna false
                error = oCombo.Error;
                oCombo = null;
                return false;
            }
        }

        #endregion


    }
}
