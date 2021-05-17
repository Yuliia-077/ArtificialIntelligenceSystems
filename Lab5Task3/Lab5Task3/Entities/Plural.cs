using System;
using System.Collections.Generic;
using System.Text;

namespace Lab5Task3.Entities
{
    public class Plural
    {
        public Symbol FirstSymbol { get; set; }
        public Symbol SecondSymbol { get; set; }
        public Symbol ThirdSymbol { get; set; }
        public Symbol FourthSymbol { get; set; }

        private void Input(List<int> picture, ref int signal)
        {
            Console.WriteLine("X (input only 16 values 1 or 0):");
            string[] vs = Console.ReadLine().Split(' ');
            for (int i = 0; i < vs.Length; i++)
            {
                picture.Add(Convert.ToInt32(vs[i]));
            }
            Console.WriteLine("t (input only 1 or 0):");
            string t = Console.ReadLine();
            signal = Convert.ToInt32(t);
        }

        public void Launch()
        {
            List<int> picture = new List<int>();
            int signal = 0;
            Console.WriteLine("First symbol");
            Input(picture, ref signal);
            FirstSymbol = new Symbol(picture, signal);
            Console.WriteLine("Result: " + FirstSymbol.Hebba());
            Console.WriteLine();

            picture.Clear();
            Console.WriteLine("Second symbol");
            Input(picture, ref signal);
            SecondSymbol = new Symbol(picture, signal);
            Console.WriteLine("Result: " + SecondSymbol.Hebba());
            Console.WriteLine();

            picture.Clear();
            Console.WriteLine("Third symbol");
            Input(picture, ref signal);
            ThirdSymbol = new Symbol(picture, signal);
            Console.WriteLine("Result: " + ThirdSymbol.Hebba());
            Console.WriteLine();

            picture.Clear();
            Console.WriteLine("Fourth symbol");
            Input(picture, ref signal);
            FourthSymbol = new Symbol(picture, signal);
            Console.WriteLine("Result: " + FourthSymbol.Hebba());
            Console.WriteLine();
        }
    }
}
