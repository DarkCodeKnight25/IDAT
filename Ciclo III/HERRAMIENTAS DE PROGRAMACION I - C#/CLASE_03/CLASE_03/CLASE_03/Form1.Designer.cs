namespace CLASE_03
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.chb_rojo = new System.Windows.Forms.CheckBox();
            this.chb_azul = new System.Windows.Forms.CheckBox();
            this.chb_verde = new System.Windows.Forms.CheckBox();
            this.cb_pintar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bookman Old Style", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(132, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(384, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "PALETA DE COLORES";
            // 
            // chb_rojo
            // 
            this.chb_rojo.AutoSize = true;
            this.chb_rojo.Location = new System.Drawing.Point(139, 88);
            this.chb_rojo.Name = "chb_rojo";
            this.chb_rojo.Size = new System.Drawing.Size(55, 17);
            this.chb_rojo.TabIndex = 1;
            this.chb_rojo.Text = "ROJO";
            this.chb_rojo.UseVisualStyleBackColor = true;
            // 
            // chb_azul
            // 
            this.chb_azul.AutoSize = true;
            this.chb_azul.Location = new System.Drawing.Point(139, 122);
            this.chb_azul.Name = "chb_azul";
            this.chb_azul.Size = new System.Drawing.Size(54, 17);
            this.chb_azul.TabIndex = 2;
            this.chb_azul.Text = "AZUL";
            this.chb_azul.UseVisualStyleBackColor = true;
            // 
            // chb_verde
            // 
            this.chb_verde.AutoSize = true;
            this.chb_verde.Location = new System.Drawing.Point(139, 156);
            this.chb_verde.Name = "chb_verde";
            this.chb_verde.Size = new System.Drawing.Size(63, 17);
            this.chb_verde.TabIndex = 3;
            this.chb_verde.Text = "VERDE";
            this.chb_verde.UseVisualStyleBackColor = true;
            // 
            // cb_pintar
            // 
            this.cb_pintar.Location = new System.Drawing.Point(331, 116);
            this.cb_pintar.Name = "cb_pintar";
            this.cb_pintar.Size = new System.Drawing.Size(75, 23);
            this.cb_pintar.TabIndex = 4;
            this.cb_pintar.Text = "PINTAR";
            this.cb_pintar.UseVisualStyleBackColor = true;
            this.cb_pintar.Click += new System.EventHandler(this.cb_pintar_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(688, 241);
            this.Controls.Add(this.cb_pintar);
            this.Controls.Add(this.chb_verde);
            this.Controls.Add(this.chb_azul);
            this.Controls.Add(this.chb_rojo);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "PALETA DE COLORES";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox chb_rojo;
        private System.Windows.Forms.CheckBox chb_azul;
        private System.Windows.Forms.CheckBox chb_verde;
        private System.Windows.Forms.Button cb_pintar;
    }
}

