import "./globals.css";
import { Inter } from "next/font/google";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "𝕬𝖙𝖍𝖊𝖓𝖊𝖚𝖒",
  description: "Dust's Knowledge Repository",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`${inter.className} bg-[#eeefec] text-[#1a1a1a]`}>
        <nav className="w-full border-b border-[#d8d9d7] bg-white/70 backdrop-blur-sm sticky top-0 z-50">
          <div className="max-w-6xl mx-auto flex justify-between items-center p-4">
            <h1 className="text-2xl font-bold tracking-wide">𝕬𝖙𝖍𝖊𝖓𝖊𝖚𝖒</h1>
            <div className="flex gap-6 text-[#8391a1]">
              <a href="#" className="hover:text-black">Home</a>
              <a href="#" className="hover:text-black">Articles</a>
              <a href="#" className="hover:text-black">Community</a>
            </div>
          </div>
        </nav>

        <main>{children}</main>

        <footer className="text-center text-sm text-[#8391a1] py-8 border-t border-[#d8d9d7]">
          © {new Date().getFullYear()} Atheneum — Built for Dust’s community
        </footer>
      </body>
    </html>
  );
}
