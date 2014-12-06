using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PsyDocs
{
    public static class MD5HashExtensions
    {
        public static string MD5Hash(this string value)
        {
            if (value == null) return null;

            var md5 = MD5.Create();
            var input = Encoding.UTF8.GetBytes(value);
            var hash = md5.ComputeHash(input);

            // Un Hash MD5 contient toujours 128 bits. Converti en Hexadecimal, ça nous donne 32 caractères
            var builder = new StringBuilder(32);

            foreach (var b in hash)
                builder.Append(b.ToString("X2"));

            return builder.ToString();
        }
    }
}
