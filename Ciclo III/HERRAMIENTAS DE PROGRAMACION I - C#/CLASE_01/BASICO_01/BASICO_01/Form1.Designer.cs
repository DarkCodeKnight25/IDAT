namespace BASICO_01
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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.tb_n1 = new System.Windows.Forms.TextBox();
            this.tb_n2 = new System.Windows.Forms.TextBox();
            this.tb_n3 = new System.Windows.Forms.TextBox();
            this.bt_suma = new System.Windows.Forms.Button();
            this.bt_limpiar = new System.Windows.Forms.Button();
            this.bt_resta = new System.Windows.Forms.Button();
            this.bt_multiplicar = new System.Windows.Forms.Button();
            this.bt_division = new System.Windows.Forms.Button();
            this.bt_siguiente = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bookman Old Style", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(29, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(461, 41);
            this.label1.TabIndex = 0;
            this.label1.Text = "OPERACIONES BASICAS";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 83);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(88, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "PRIMER VALOR";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 125);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "SEGUNDO VALOR";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 169);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(73, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "RESULTADO";
            // 
            // tb_n1
            // 
            this.tb_n1.Location = new System.Drawing.Point(172, 80);
            this.tb_n1.Name = "tb_n1";
            this.tb_n1.Size = new System.Drawing.Size(100, 20);
            this.tb_n1.TabIndex = 4;
            // 
            // tb_n2
            // 
            this.tb_n2.Location = new System.Drawing.Point(172, 122);
            this.tb_n2.Name = "tb_n2";
            this.tb_n2.Size = new System.Drawing.Size(100, 20);
            this.tb_n2.TabIndex = 5;
            // 
            // tb_n3
            // 
            this.tb_n3.Enabled = false;
            this.tb_n3.Location = new System.Drawing.Point(172, 166);
            this.tb_n3.Name = "tb_n3";
            this.tb_n3.Size = new System.Drawing.Size(100, 20);
            this.tb_n3.TabIndex = 6;
            // 
            // bt_suma
            // 
            this.bt_suma.Location = new System.Drawing.Point(323, 78);
            this.bt_suma.Name = "bt_suma";
            this.bt_suma.Size = new System.Drawing.Size(75, 23);
            this.bt_suma.TabIndex = 7;
            this.bt_suma.Text = "SUMAR";
            this.bt_suma.UseVisualStyleBackColor = true;
            this.bt_suma.Click += new System.EventHandler(this.bt_suma_Click);
            // 
            // bt_limpiar
            // 
            this.bt_limpiar.Location = new System.Drawing.Point(404, 78);
            this.bt_limpiar.Name = "bt_limpiar";
            this.bt_limpiar.Size = new System.Drawing.Size(75, 23);
            this.bt_limpiar.TabIndex = 8;
            this.bt_limpiar.Text = "LIMPIAR";
            this.bt_limpiar.UseVisualStyleBackColor = true;
            this.bt_limpiar.Click += new System.EventHandler(this.bt_limpiar_Click);
            // 
            // bt_resta
            // 
            this.bt_resta.Location = new System.Drawing.Point(323, 122);
            this.bt_resta.Name = "bt_resta";
            this.bt_resta.Size = new System.Drawing.Size(75, 23);
            this.bt_resta.TabIndex = 9;
            this.bt_resta.Text = "RESTAR";
            this.bt_resta.UseVisualStyleBackColor = true;
            // 
            // bt_multiplicar
            // 
            this.bt_multiplicar.Location = new System.Drawing.Point(404, 122);
            this.bt_multiplicar.Name = "bt_multiplicar";
            this.bt_multiplicar.Size = new System.Drawing.Size(86, 23);
            this.bt_multiplicar.TabIndex = 10;
            this.bt_multiplicar.Text = "MULTIPLICAR";
            this.bt_multiplicar.UseVisualStyleBackColor = true;
            // 
            // bt_division
            // 
            this.bt_division.Location = new System.Drawing.Point(323, 163);
            this.bt_division.Name = "bt_division";
            this.bt_division.Size = new System.Drawing.Size(75, 23);
            this.bt_division.TabIndex = 11;
            this.bt_division.Text = "DIVIDIR";
            this.bt_division.UseVisualStyleBackColor = true;
            // 
            // bt_siguiente
            // 
            this.bt_siguiente.Location = new System.Drawing.Point(404, 164);
            this.bt_siguiente.Name = "bt_siguiente";
            this.bt_siguiente.Size = new System.Drawing.Size(75, 23);
            this.bt_siguiente.TabIndex = 12;
            this.bt_siguiente.Text = "SIGUIENTE";
            this.bt_siguiente.UseVisualStyleBackColor = true;
            this.bt_siguiente.Click += new System.EventHandler(this.bt_siguiente_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Yellow;
            this.ClientSize = new System.Drawing.Size(516, 222);
            this.Controls.Add(this.bt_siguiente);
            this.Controls.Add(this.bt_division);
            this.Controls.Add(this.bt_multiplicar);
            this.Controls.Add(this.bt_resta);
            this.Controls.Add(this.bt_limpiar);
            this.Controls.Add(this.bt_suma);
            this.Controls.Add(this.tb_n3);
            this.Controls.Add(this.tb_n2);
            this.Controls.Add(this.tb_n1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "OPERACIONES BASICAS";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tb_n1;
        private System.Windows.Forms.TextBox tb_n2;
        private System.Windows.Forms.TextBox tb_n3;
        private System.Windows.Forms.Button bt_suma;
        private System.Windows.Forms.Button bt_limpiar;
        private System.Windows.Forms.Button bt_resta;
        private System.Windows.Forms.Button bt_multiplicar;
        private System.Windows.Forms.Button bt_division;
        private System.Windows.Forms.Button bt_siguiente;
    }
}

