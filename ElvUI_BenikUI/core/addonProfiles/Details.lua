﻿local BUI, E, L, V, P, G = unpack((select(2, ...)))

function BUI:LoadDetailsProfile()
	local key = BUI.AddonProfileKey

	local profileString = 'T3xAZTnwsc(JzJn6UQODf4(y(gPeLTwRRvKU80B4qWGKqKOfiahaqlZAN2)2384DbEb5QCTthtOORwwI8DMV8oZx(EW(HjpmEDD1J5fz4Vw9LS60IIKzfzP1jLzp3wvVyzAt7ddFy8S01TBQZsQZslWgVe)x4ZBwNvumt0Ov5nZMN2MI)E6MA6FZkZQxSf)T5PRsxKb)w7dJRREo5X05zj5LWODJ9dJHF5gNhUX6xCWVFDr62S6K5zTP5fnjpNxoV6zCEBMLcRwSdnpbDz8OIV8HlFy8uyf3M9vCj(W4XpTTiVmdhhC)WJvtskS8xuxTz9dtFy8MgyValI0Y8vPT5vLn4NwNTUQUnb3CjWq8K4dxbGgANVk5X6QvjLPRY49l07nRsuqUQvttBtAZxHlrlyZ)LSs4VRtN9uwnU8ZktNwKnhh2hRGVAwvrvndbW)ZH(Pl9tp8NWwOzjSmNbR15ZGEuxbBOVSchaCp2zaS(fBbmKhe6F9W)1fhiAcBwMIqYX3C7nJKFu(VjwU0F(y6mago6RRRZAAEoDRyIwMLVyzl0UGdVKwJaKhRriZerlAZBli4udabaSIXxD7hXJQzpnVUAD3LoVW5LTyrticfvaOJGxYfGRfSsFoFE7sOp(wuJWfO64)CgP5BFECwDwzElSdQwthXjY1xlHdYh2TvjpVS6HXAcGhlsxaRkxaRNif2usOnWYyiJ4ahYWod)WY5jnz1q)swNwd)g2I1aQ20P1zFjNqSW904NRQlMlXpYBquIML4UcaCjPnc8sOZtRQEAvA9t02rE0ay7k80eGIlBEcG6bJXxYkqiLN)dJl3SkRohOosA220MTc(NvtRkAqkXwy7ruBuFjedOhZZsBxcB)QI281WxbZkUIyATMtsEUhRIPvnn4YFVVy2s4pZkxW4bzlwbeea8zfa6AtWEb02RZAy8pe22Kv8Oa1ykH5Kbhz1WNu(y(ce16rGzd8bBwdCAYic0)Jn5ZEc5vKnJa4enBtwlUDNLmlD2Ym8ZkRsaEh1TuFMN3GuIjR22UmFwYC4moJ7kUi0q70zZYkyEwiNnAJvUzDsr1IQnTy7ZlBAtlNL1KihtKz0sazTGqyNsq65qhawkRYfKq0bEE5IKLv15)gqfbhClsxJy)IdgSdeCOrXVf6vwgW0B6MhFeGn5fa0gj6YZkNxS9XCe7FoCmwvNIqCyG4wUEt9AGsC8m4SgoBHrylW1gzdi4jdWR54wK4kcZeYbB(AcqryQi4FgaUlH)p(H06kz6wKNAzkGRMUI5WdqOP1vaZoc)fjQiMFj5igzr2xiy5UiZafIlEuNwclEGGczSBCeH4aTZwYSEr0va(A(9ilcjnAY0nTTcM5Ra(21Btas(hUjWdHgLBtAMvbIbwbS2G9Tjp)galzvkHRlhyMsGPnB2J0ap(zAd83mio6sxj4u5cCQmqvA2SM4VkyeGN6Z2uxJsla4oS(A)DlVGpsKDCyV89JaivhIG967(seAsxTgpzOrW)W89N(dMVFGVMTVdX2Nzba8OaG1xslybDhMxV8dpGIeThG5A6xLmxDz(NjW(EnkQy(wq4paRem6WfiYVlVmPQuIX0qZQg2reWaJVnnDGITO8LuahiFgU0AwHJ34lXDd2Rpny(8BlB(KqC2NYrk1MprDjt1CEeqgDnaGTQEooz3e4OujWX3o2312XxGI6g6lvoa)mgI7)aYwYliu1nzZdCKnx24aU1bUQ2sdPJOnhCOr50DoW5wyCOBlBOTwzg1A(yT1CxU72RBBH9wKQXbQwhEKnNJVE3fj2D2hEn4DSn2bac(NyVTxZdcovRvng3W0GFQZU9BTb0W1jYEFiY(Dj(uRNqzZJenp4ON471w)WWtCqU3zJbY9bwiUQrNh7i7tGNU3q7DIgVZi7e4Fci(Eno4uOF71AnarTmIoERpjQ9EOHbXhd3E)2gADQfYUn3O1hNTZUiw2wohhO3LAl0(OR8DGj2wUh)WzNb15OiQ7GEyB5Dca9UmCcDpfOBNH2OXhaNEp0u3trVShOW)elKDyNfyFuGXUyD(bNGwz3dznTYEJ7En17eKv7GX1UNnfqpDmu0Ihkq8BsY6ksoCzv9k2fgBF4I3eghfe5B7gB554A5z9WJVXduv8RpCHFqSVxqSnWaXnmc2SW3GgY9WfHwHow(baC13YkaqFGVb0nzjo1r0scuWHNay5dJfQJ4ZcdxrTxSSelDuzjyH2UPrOslQKGuDau3QlISTc8cJTT98TJ8DcH5cennM0WcnZahIsvpHT8sT6Hbe0ZbnuyEg(lWuoDrsnbRDIHT5JBkkMc6maQRZQYHG8XlZzTBtQEuyXQHk)c1RpPgOcD0Pnsc5DPE1QXSlnOJvMvxH2tH(UPjrOmOW6BsFSuW4QYKvBaDStqfTavnbRPiBqtsEgSOUADwPqhwJDPeCnRamzSDjOz)ILsBk45E3VSg1NBQbi)u(zawtK5fKozWCHGsYk)InlaCs0uINHTvTWqvYWAeinpRbWcaLLzvEn(Ze8GL91uhqI8mvytsI2VyPTaOaoNYy4V4GvCSIFeTBeWBEyS7aKoT(50jSbEAAX6LPiMtSdHEnvJEP04FFq2BjFNiWQok2ePLpJowIMGs2ukPOnmnkVe0gVHG0GDaBiVzzrmPEPn09L2qVxAd9FPnm4L2WWxAdJEPnm(L2qBRxClFXNn2V4dh7x8PJ9l(4X(LE(iCwnXRwzNi2x8pEy8fPabK08sP1MgKhhhbN5gVWKCPgSfexgc2ashFWmD10QgE((BF(c0mxGhu7wKpBZZ5ypy36uZUna90dWBexZij)jxrgaeYbKNQXctCfCEzhwsE4ceC8ytgaKFd6upXscDGLCf1Ttos5wOwq79TUQV1nIoksRZs3LDoljfGpimK(GoWb08CdjzMS3foea(4XKG4HP1Jbl)NJqRzzOulGR1OjdU8QXjJNmyYhgpCW9j3D1hE7L3KC2v3E27Hff5GIJ3S7o)UXM4i90YjmS)cYRldMnd2wO7b)2NVRod3JLZ2YTGpZrHa4FnaLisoSG(oLt9X)6SEDB0jx)Jh92RhDZeYTjS6wt2UwpZ9VsfRn7dTU)rUs5dK)yaq8VYxLX7q7FVRr0fwzp(IGQcnMAZxt6NMKonViVnhDkUl(3GEmRe)vhEl8kyiUagIF5qC6hIsEgIsvqQG1ii4M3G6aY()BkoesTJLmw6O24BaLm5Te0sKLOmeg7sy6PimTqDU06OLK0uMU(D4cayWj1pqWFRb91AxnGyftkvrptc43HwxRGAhc48sUFvLfB1ZoUzCf68ISVZlFSsIxCpQClfGqceLn7fQJk1uMRUWicA4UYC4W5I5(re6TvSh9zoe4Vrife0OcG9Re64iuqYiQbgRMli)73qm6)0hU8nI)(Q8M238oDh6SweUhCO8Jz(6jZ200Iorh1Jc5eN)vqdZEz0lhAbxDbvqY2D(aCdGQ8jIlg7zsvKCoWY7LOPPYjQh7qIed(PZa1U)01zZZt)0fiE6N0(z9xABFeJAeHWP1jURqkv0nJ0QTsIa6FfYiME7j7SRcVGCLHeI83(SJoySk2kRQMNvqOmBwVgW2P)gKjHrxV5tdawydRPWkaFFw9BXWa9lx7GUj)zDR)igKXpn6F)Ub3m(YBVXY5tNF7TNp48Xa4PyEADD6No72RoFW93pa4t(HX)Ykh58P0I3xoMg7g(dunXw2jDtu4iMiyJ))IXdY(F(lF7Z0V5(pP)X5Fkzmn5WegzTpJr5IjE5HTToTSbykQWCL4BI5BxCdDdofwtYqWSTNaSNveIJOlnFA4M8BlZUdiok(L2fPcB06G0yjzLqAEq58WECJBfDeSg8jz4LbB32jK9Hs3ijDoQ2Yhoso1vfzhdTLcyQITesU)DyZDNijioE5(VOgmXKmOCpqnfspANpLYQbyz(xLFYHzYWAo3DR0L5dn6hLqtHeqdu5Mvt5WS3Hv(lNHc3ndMtnYn59he79BF(VkqB)Bk84)N)KbjUb2YbxuY1Ax2Ju)gTAnLDcceJ95AC(FjFw7MvuWrb5MPpIr((WaqtoVNckCrGTDKRNvSLvqKByi6YlFpdkytidgRwjzFefbD5Kt4jcCXUZu7bLg87HoKapmf4rIdPc7zNfnWDAgL5nsDjWKgizDJiRb0N4nzRtRbLhaT8)Bcuvtjfmv8okOO1OPt8nP9zgc9Rl3H)z(uDChrNcsEf8I3e65hBfBBhggghhezjCK46Q8sywhE7Kj3E99x(23Tt0kvEmuPvJyfzRqLoUfBDvQ6fqVW6t9R74JXeknc64OX3q8RrBtnyviSddPnrI)gbkmMZh4icmAMI(2b1tA6oMk21OnXxb6TsjPc5dqreZjSuLtVe(isgj6vmZcL6VJvwrVtc20L2hZWR)P5GWCWK0YhkK4gnTa(KMxGn0SNSd5qq3rhCQzUAlY3LPQri6nM4PlyewdGvxOib2i0zYTIteIDhkfepDF0DY9Lvn5ZsR(xm3NZOJeQFxx5uvYgUlDVka5QizJK3zLUiamyidS0xsuTlIAhaWZWNVoD9E5Kbp7xGBOWallVilyZgBj8spNTcx4feg774aBzF)aVWabqcokPa2ZN5xaWQqFNyxlhF7O4ipCmiDdUW3niYbyueydFSvGpZWgWoaGCKRVNJFma8DcSD55LyYhzf7554fhB7574kIBGgpBmL8acTEVawF2bbH(((WgX2rEKW5RdEi0HTYfGOJq7Wy4u33o0XZxmToh9BCp634jaEEGejFlxCpQwQkXH9AygWZP5tzfFztoBmnMmvyev2fTOylESQY1oIdVXOF5z3EZ4pD5n)AcGQKxKmbZnRvNYj1eEOkYaMPijzS7bC3pQX2(rT4aXxyh1eDuzyKiQzYqOtRb2r3F3X4k0l2Zj0YoYMoACmisDbLeqepalYZ1)1yC9AmUEngx2VgGRxdW1Rb461aC9AaUEnaxVgGRxdW1)fhGlBXM41aC9AaUEnaxVgGRxdW1Rb461aC9AaU(V6aCbNaXoE(ww4p8D9qFz7frEj8nEVgFRxJV1)ni(w))bxN)A8TEn(w)3K4Bn8py8T0vRduTJg6oNBCz6Lxbm9Lgh5xqchtGT4I8Yu(CMDS4hR(43(ScSWN(15C5XOOiFEJmkmnZaALc1LVhzMACxUr7AA1fbMof)fSGCK9SSccqCHNyyeMRUeM4Y3LDJQUGG)QGJSUqg0UeygVem0H8wXSIQnGSyUS8OlVoatXNYktam7A8s9xUGKjq7dzXwqhqfqRIvspj8Mid5JomV73yt6nnBjUVajzzGQPZ3bRBRPjdFTJ9dqpOkLdkNewjQkQaZgwwumOAKd68hh5Tzxx1lE3hUzYO71x6sPTerUc0ep8wao(JGfFxERUDHrYloO86H6ruC3F7B)WOoi6w)sCGSjeFYRh82rQXXt2OirBIj4XG7hDZGK)(ORq1IKTnwoEAT6)WnV9(B)WD3D1G)UXMWt0qp58so87(pC557SY8ed1Vyrn56BV59DuLrU38JzxgoyY7E)nK6uk4qO62wkjRi4WDJ0TXDNLdbqhp6Ql0x12ylB5UZ1X2xcW4phB97gC9GB25cE6jhWOqgw8(BmGw7tUJlR7VC04jhZhn3n4QbNF5nAaEG8oNQUx50MB0nJU(VRBLhiG2uZVFbw0bA1)auhHlvfx5ujQJVe8gkaVa8Fx0r5rPDCN2QCQiWp8MrFyY9dU6aBkcfz0VE77ngrh1rVeJdK7AGZ927hn6M9Q2trQBhlZQeynGmVwMNvmxeSxMSsuEi2HSQVcxWUKxNScoSdYG5Tzg0EWl4OxE8UuEhTBDNmte5JptDV5YDO1WV02kwFbMb16SbLqo8EZKe04MxdQ2y0LDVqZhKYS)k6aozJp1P0o7QDip67AwVhbzF3J8UuNDaYoDHJh809W8c7FwhacKrP8hDETCIH)Yl6WDVdZG(aHhIgxC46E673(43H2B(cXP2DAnLk1hCTl(4oCpqfmT0fMGJGeVlhVEwS9EJ7XQItdzOHVU0jbQFRsJdDei5AjfzKgxu96uuW0vdSKNYYwNmndDPbOKgAsgIc0PcIHdsgmEcJDjDI7w21CK1VnWk81lZNH9FzvRW9fGj5KTHtydczDs2TqabQVUyrwTSya5RlKqC1MkBEozD506Q05Z4ctMHUrKQHuSAK)6DvnC5lACD68CsjYal1kauHNc9tYZKgxvZR0wYtqHwv4pvE(P1utyznqawORs)6Xu)0ZxR(jGTTFbDtxCZiBkWAu3J1PlAouv5IdX2P8d6UvMor9KtUMlRs0(pAQXr8A40yg56FUmDPvqMDUJYq3oRDrLiuvGjpAz6su5ljCxkX5g2jmLY63fchncyz0(5yaqcP0fXvPoPRqldPcqMJ3Am6zi(5EiSlbLIffpTd4xfqDg7WGD9GLHpxvIxuliB1cYwVGyhLz6npYaI8VK3uv)sQXyKbqjtxKCaBybHYxD1WBV99FIcUdwqdFZDGLjVXwADoAxvgyKcNTI446BfkItWBC9fSffGcDUdURgRsBaCvBlaVFkhz4Bcfrlct6bm7rWY(MmSuCA(XEeQl4nCxyB3sFzy3JX206fYtsDEOb4oFKB77O)r5ucGNxbCsdC9OWMk(uKldtMZ0pmfmshSzk5biTVze1JnkkjCnwJcTgy4jWFCUrvhBFV3Da)HEKSrt0sT3)lY)TFlTE(3(8ebXbViuoCubrpnkJCLZR5oX8g9NaapZxHBSvzTlRMZz5hd2oMt4fFTWDYIWnRrn1vdn7hUW3hKQ674g5yf5WEK2N0E)IixhNaFhqSBeqH4APDPtyqONTRNDyORFGDm59jsw4f(wobw2013WX1nmwfHbclqdbL()A89CbYWgfRp(ksTLqQOBbkuz8hdnAwBNTIj3MODmknYOU5r2v)y6MIwD)WjaeQJhb1ZarZZaCW82TKNkKSlfLsp2dbx47z55Ahdaa)yq9kBE)TtHn8u5iQuibxgo1Iiy5RMowrlhGq2zXFGODm1w74ihIkZyVzgqxPSH)fQ2jovuuetaaql5dStxvCfyXtU9oZACS0hrORH3I(JbPD(Qizt(DuofhQvcG9eqNc5OBNWqDrD(V9Tp))Et6CCzcK)ISlr5IhNVNkWimxlkQMMEohjzqJPS0NWGSWoDdDVe9X4cL)K1PZNJ(VcvMHRY0yvsnh1DtvkGXaBy0fvPImSZhRfq2LqYszdHuzxlFtGgGG1KPN18gnu0y0PcN7lliiuV0dOufm)aXoe1SWiKIDkTo7ace(Ep03l0cdfHBqqig5a237GcxlYuf(AQROQ1a1BdItkRF17bwjjUVqg6AqqxHKr7b4mONwGLd88z7oNnkPX7d2f7uFBGJRlW7gyxhgB5j2P70yXWXdKjkaXtUpsf6qAhGI5PEjBrsReIoDBcR0pL86mmx)T7dVzfg6F1YOu6eHy)EAUQ2deioi8S2VFNgTzVLGed1mOShlo8ynLwOZPY2rsm2EN50zTASTC7mXDhtPASsLyLQW67FqqgYG90i2gQG0Ly0eIU3kwUwDInHeV4a4q3cbrrP3O)k67WdmLMRN9XBmoIpc4vzShAFjJ42h7GdGEtF10dmjVaAAgT(WhfkPqwhb1Ye2CWHWKQzpiZfEHEXrXwHbrrbatdhbc(bwQcOuKTU0nxNnJnAF3OqlnnvzTBr(JijpLlgSrQfzFHY8uomqHQRav6MfjG64ZZNHx4fgNvu8T5AooEIdY8aRQrdj2SgJ2fNo5KFrinl5szoTVZxTI9YCYgqLlkhPYblSvPjv56z5Zt4icpN7cojNrHzNZ6o(tLkUisXlkCpzGoynTGwBz1IiiPNo02vmLgWOytOumWa91Sm(zMRZcSiT3cOlZq7Aqv(zH7GsKuTvVbDbsiOYRtOlk2gM1Q6Coc8BkPs7Tq9rKl0k4udoZkwR(q)y0zgJ)4Lto7Dj3n4MrxLCXL3pEsYT3n6MrNJGIbtMC)Ld)WKrjJhD1OZMKm5dtU9(lhCfMnBJrFDu2OgOj3pAW1JUp5IrdM8H7hno5UBV7d3rTCwBDHqbv2d7Q1kabo)YXdgE1OKBVHC3lVuWEPgrrwrtRU7)Wn43n6MZULC3yYqOrV)8B)4nj39UbJhn(yFlzC9GpC)GXCQlLv3YQzjm0zkYVCkYSCkcWMAysm66VlVbgLe09FjF4g8FSp2en66BNC8LXzVBW9tWV827MC5T3mwa51WC9ZyGegnufxKK0YsazygFLT0dVmrYho4QRU9MUNsxJ5((TxpCaC6D51J40aH8biAOa(qdO8ZOKy9506sSa7NpNp9eV9cZti9qrV5zPEllmARYhAo8ByI817irxJZr1ZBrod7whXX8irC7zytX4qYkc)QA5slXc0vOaZxGQKZHkMqPhYd0pxIu5q)IiOTxOBs3IzxZxxhB1Mrr5f4UbR7mbBNKjND7qd44SL4Bga5mxrH4NsHafDVKddYUH4Wq8kXa4IPZea8MJfa9va9jh3AqWULG1Dc(0bSadHTCtISlV5OF9)XMS6TICix4s4eb7dHgIOKmzcytCAhQaGmJVJca19HLho3iEyxaYmc8CJTdC9Jbd(PmzXsh)lmvoS9DdDcJTDXCvb)(aX1rtogbErbyoM4qHkL8naEVEOOBDrqaG0zfzzf57h4ZjgNoSZxa29heeyfefe75BdAsd9nwgWQli3x4f7Ah4h57ytRohXDCto7(Hoyo4e5hcRb3qCcW3wbXShBb)xCe(tBlEPfYyQAanEcYcVqzZSnShxLphTsFkptcFASNPRgvyk79qYGpqflsK2lUoTmJy83Ho640BThf)IchHLMO6aIN0yhOxoCXcWbAo8xYMVJmYBSnTdA81areBR8btSMNbdnsOa2FJSUsZxq5bar23(mgaIJ25pMLUgO0gcmKScLxAtHjxWimQ8l51vLOgiF7Z)1ZRbJNbYUF6Gd3aYJ1BtgV5XhRqWJ8QDIdx0bgUXfWz(PhRZWe0hZCN7QYBG1PLJ8AGsdAKveVtVihtcTIcyuVoVUUQ(BF(sKJZpXwq66hz7iVxOypJ98cfWiqKEMybnRgqbGZADVi)OFJSYO7hh4YBKlQRAANwv0E8jeOsfxBuQRhy)FrAB(Inhbcq4cjdQNbiOjxdIzUMS6BR8kMsyh(rUUK5kJVBd(WSaCHHX9zaJ6BF()HTAT445OUWPcJQpWIbTPEXPwmxNUiFwYfiLvwn2E1Dtfh0GdnOWXYpDCe3niN(lqQfSHJxNdWF1TyLqJD8S4eRz85zFbSUbKosi0ZE6BF(QmqCgmjy(E9uwRC3gy5fPUGR0Gy7HVek4G8FobGgHr2b)B2E4)zb)p(3S)3SDOF8FcR7BtFceWu3(xWlvDzAnOp(3(89sOj2F19ILiv88cyc1RY)cad)2Nhcc(HvgijeuAdyQWRnWYx(veHVOS8AZnmkqT2cCcCTp9A7SQ66nRBXveAJwHWRu0OBhW7CjwUTdyncVYEBrAoIvmby6cRm5F()Wrc2CCD5LwOQZ2E2ENSZ271zj6URBO4C7kWCfWGPQvqhP)14CYM6JeBo8aiqxL(L0tZH4(LBRkqZk)1QcGwP6b2cpfbINJ1XiqC3LaXX2OFCk8CO(5Sx)CuPTn8)y(k3c96r(sc)TppIEq6qomGnzlfOQWu4qjZe6xubBPilh(86DO7LbS7rFLvssCeh6hr4EoE6z0pm4eZ4o4GgtQeh033kMHrGcRBaR(rmR68NWD8Dl32O5iIZpFq7irX8ITJyKK3v9CbJ8dQ7q8fbdNaCgYpcA2IUU8J8GKaimYHVCKJhc6U3SgZ1sOZt6su7bQir9tIG5eefhZyyVhyosuOJR2uSBxb9ISI5PuX1mgZlybYjCA8Tpx943(mWt7BF(AGOFBnkPl1KzEaqgrh0Uw6LDK4G(ka2smkaD2Z2D69cWmBG6QTQRGqRqbjVxGBSJ3PP4)vqLHScEvo(PCPfYIdepxIkYvXY0g06mMjLwNppBv(SJCwak9r4sUkgLHXbC(LnEiqPohqFgMxKT)PrGLqxbjwiSoWAj2brdgunA3tFxn7pqK6ElwJEOwJbAapOOSEn(Tp)o0)fZ3Fr6yZVTdUgOA2((IZmGKQMwM3H3dpg4(VNw8BP5FD3HYX3dFplAPllVCOSTzTqhF5IssVre5zrgIiCbyE1ElhB74yxgOfRgem7TPb5(uy3)TppyE662uE02D7a6IqA45jrbb0OJs2oMIE0UeTEAuWilor4hdCnHjepKfGZrs(f7Ue8DJSyuzphJDqedgophGLNNLT(a0UooeTRNRz34PFcEDJZG56dRpXw2ZSJm)XjO2q8X2VMpdS3F7H6FmbX98nOAdyQ2ZwMxuyq5F)MdW3XX3bFnAipAQp59edX9vTZQb92rKVFfGDvGU2NxvShli7qqUCaVs04IwXCstn(JGMY1nRR20UxhdIJcTiYBpdmpRqgeCwv5SL8w4CG153(8hxMdMBuVp7tWgZiXrxS5(W)37(W3GpOBeRo59GA)mL)eW2)SM92oo2wGXKeQGVgtemfYwYmeJbC0PzgEvkYw6JPBNvdtbsUD9MMCMxl1DA416pcgxl5wagusa53NJAp(xVdmkhuJrGCh65lEyOCvQWe7l02h3qfP14S9Rz1O)uX9MXhcsGaPKTkPSG(GrbCfRrI7665Bjufz8tBkEIz(aCUWlk3HavXo0jV6b8YgfBWGQbyyClqfHZFCxt7gmFE1(rdGCLBk1n0Y0hj1SvVMoUEUUcoJ)AfYiAiyzdFMBbQoZOoQh7RqGFIVjh4XKPUV81bQg4CHbY87LLCDeHvPpL2WrHU(UNgD48Szv1coMiHWffOdZyYFQ704hRgFBpoPdzrVrHo9OT9iuxB6OcmbkTMQmmlwjoJP(twvAzUbI(HVbuVqs44hhAUbS6HE5(nRMYuL3Vz6wXzQDGJh)Uhjjua1198LqgsRcRtpUxoJ0QFoUda7bBaRKY0QKy1516ZnYp2Yvp4G2dNEW)WQP1zfnazcjpfuSQDtTC0f6EOEYMiyILIfIVhWh40d)yGIB1BgH8DXXFyfxmoUr05oVDuUrrs1PiioOYFpgpE58kHGL72uNrNWPBLymy378q7bREBxjGpW3kWTNH)AmdfrTnZZEe2hZwkuZf75dCEiOq2JdK4k2aVh34EnTKEyLjDPpJVhOaZCbod1FAc0uRrr(MutUX9a4VoVmNCNdCga4KmDvRIAYnMH9AY1ql3atS9(mC)9BRtF6P0)cLyqPScEJKKRwX(oDEX4G5ZZ31y8blP6bZjlvC2EE(M6sAIoBzflcbu0NDmG6jJdSG2Y3rBDVvFuvJ2Mj1ZV6lPmpvYLdXXDE24qyLRNyGHFp2UNb(JkKDGALalGbMmjf39opiCOpFDmb8(9H6mEDEB2JO5xeXLqMQJflUpurRgh6g(NWjQVjBmL6eOF1JI7fN)FSHSFG0ieJttM0YnS30WhOppXexGhEqiOFCpC3VUsQKkM5GT5psAjOulNDasyObVgntyuBP(yuEXM68QnaS5Eq66JSJ506AXmkd10REwwEAgcXww9G18UQvzfPLOZVsr1cExvDPuXy7qg0hRHnXrYfVVnyStpsM(iO0uZmuM6hxM12GUHvYQj2pIepfzzEUgBIqg4F6rFqrXBMaq)vDSUVrzzaJyQEOo9SIcICutGdAxEpcUbfbWOHHmZy39DoO9Ta1H6pnbAk2OypPMbaIBKDp8kFlIjYl()xPlwGyOxoJHqbWrxiD2gP8wVvyCGTItdOpxpyoGzRzeMZffvp3f4luQjslG1ZrlGfh6(Wkbjh)2wM7oMnaOPexuOmlNTOjYxd6JSvIrIWRDDpGMZ)hP1B2u(3ajSajBQW69wPldCOlE5nrArSEUo()Ow)(cf7JmKZggOzkagj70dtHny(HpNCyWQ0vRQq)8nwBJnrxffPap2UwbkLN8dSc6bZCubfpJ8nRqVBGLtgGCqq3Y9NMGy1e44hPKcgJViZ9WwaKHmd1xfdUerynmBBvjlSsmauukSm2coE)G2c8eqM5fRvloosRKMVvSNJtFQfpDlX4PynA)swrHqdWqhposAXo6vVNJKYf48asET)oCyNuO14L7T8vIBbXyXIWNmL8Ke7wY)k(7BRWqEaJ3J)0lYcRSPy1rIIkaohQyu44ekC20WnuIhiXZH5X7Ux2yZ5O1NMYdqYJu)tAZZQ9(L)X6f0eQiRD8KGn2ikYJsFNZuMON7mhkNp7e74O56H7WE1FJdBIuemMnV4igQgrF0JlcIzpB)4(mM4csbfu)KjPyojtclxS3zTICMl30cAbyg6tbiz0fjJdzlHW5q5zswLZyf1SdOZSsRFxxNaN(uakNDEEw9AsHF0(fbVoS3CGdvKYyuMSnJLwFQOmOzj6ynLq4ryPMQb4C8ZRRRM9Z6GQXARGshKqkqMVw55y7G(0oFWSzzfz1cfCbnUMVOivmbu37(0p75yhh7zQSyF2V828hfrl4d1n5LziPUm2mIbO7dbnnfb)Pmfge2EEYtKy)4W4E07AyDQYVH0jYeqH9mM5k3)UVGZ05q0FcNdgAv765ykFUNDWni3TvPOMxJwSWK)nP7yS4jOwtttEKqm(o4F1JYJdHLCvrUmUatEoN9o6pxNbKFLmslyiJLJG8iYGHuOJHBu6tvMRYsF04Oyq5SCIieyv(ZyQR9Z)KYZbEIIgTwHB4Jc7e64E2wNLsQrcAXxxvl1wYwefwvYbedQ2Rfwh60NIW3H3WNck(sNvNoLhxFRipoSB2QeeamPmqbCaRNamGE4nDx(AKX6Ov4LTCoY)dlsNaSbbnhqqYThvqIi5xR3KppzkisE5Mfjtrpc)8sWWvPGfBBnVbFzKgqLIal9C6b4If2MYzPffiwZzfPpJhHPvzYtqaKWgRABR5o4P1lYh0Im2VhkRFn9P0ML)nb2chLNmtfVyEO6mtaXhT)bGpQCTNdZ(XwlMpiko6hJabudHnnz7ltWwlWht1nLjSGT(95)ZlHZKY5znZOTXiqXSsHvuaahq)f4OHgamFdXNHEX9zflAZ900AsfaM3Qu6j0zE01bTgyo5QTsZ3Rp)hS9VmpLuTOiVzvAP0gkqDxEK1I9bUObkuPGW(g5Hzfv1)LA4Nnk0PnLcad2DopC0Y9XSe4hVughBdcoFjTqGxqqKBFmZAtNvSTHczmAMgAJWqvIzeWcbCCmy(4f(dH5ZQ0M2VlMpf5iRh0Dbj41)xXTrL2hGiwFL78avAbne7Hzt(QS3mzzE2JuMhKUAAoB(l3zE01mb8Id8)dXlBxwyogK)(kmA0dOr95)6bBwSbdwRcX4U6CS63jDHAe7gBBhdAE)aV)uMIqtjtb)qqoWui87c5amSJlfZ0vOrJBeP1oYoqs5bcOSC7BTnED(tKdn50x(5mvkIHjQLqncNydoEE6yU50lh1ZQsxSPG9GXBZkZ4CYt7DhrY3zPvtbJHU028qaFPNtp4OAr6k2JVyD6c9oI0XAUoCkby7ABS(dC(XWX2jsGF7AQhGYCnSicc7GEap1BqB)pVolD1S06ViCiRlagc4SiX2vRaGJRkWy)X0mfRC7pVNIPUAEaH2k)dcs(GJHECIXnBxTHsNLpusvIewxEPKtS)8myWjatfPF4IMD18bcDuIGaGjM4K95I2mKZimh1GmUROCqS6rEg4(ZZGjBaLpA)JXg4NrHe)SmXzaCuoN7SvzqegXDhNFWXe1wLBrKdZJ(X5WChhhHkhQ8pc3bEX)q2bORBehgQCuc3bb2)iD5VmRDDmd9Q7FgZGI(g0PjiYmQc(94A17ZEeHleX2GflWAPrELoOc(IhKhfzTVFKYby(oEr(9rw)oKLuJiyGKiQ55Z0PpdZ2qLWuEEXEkx)7h7bkK3JAzJ3IjEkWvcvlByD2Zy2kYKbC35jiqpbo(gXKcmFVVqKIXOEnP03tP1Z3wsPeT06FS)8mOiQ9IIIvwDgfh762NhXwIPj5CrOmRRQEci0fApW9NNbfPSVJRTjqcWQ6biHLcvghAaiRRoNId5mfyY2vaMucPHdhvIRGTWPpPCJZFcKSrmNWSJfZB7b1ngoHHzyOsKlamfBPDHoa087Zf6GuHskesVRQmdZv0n)2VLjrLIKIsvP6f6zhLj141JWpOh(3NrSUbMgpJNfz5cZt4UYdUJEW9vraGW067u(6mGz0Co)TMuj8FKON8yBqf7QsKcglUVfosKnNsb2Fl)j0S2pM(vdIaXI34(d4O1WfpDT6509cktNhMTmdJEeNfcz6TakNKMbfDSVvOkisaAfW1OplmQwjI(iLJ04uCE2xQejcOdE3L4PqrjdQ2fzUjS97r()4n1zpbO()FYslQAz(rIu5dedJ3unAcc17H4aDyiJd97t6mNlB3b8t1b4u0rEOJm4c1H8YYRV8cB1AmVHj(0NvVTHEjKQ0hXcNQ5RjGJDvoU4hiJuvMNbiPoXANO6e2xaG7iiyeMtJ7bFc0KUXrQqG55ha)vF3GgqV3zCXeaTsiT(ndEZ9GEry9vbdOJ8gfigmE6Cm42569JJBxKvK4EXOiP9cIS8)tGIlqlz2ki(pfkUanrTFSwUJRDSLFCFeefGjOZes2yd8fQOIvFrgNnWq2CSVxhC2EOkMakCpdmUIKkmbFEzwj8lHO78eeAY02Udzx)coj)8yAzFv9wd6obzHw2COVshpFGnRvuVMhwUq4EYXltXlBbPkGoRAcf4sXg8wTJ)HDsZdaFtSSmz9zkDZUV0K(SS0MmMqy8ZP1RwGPXJw)cXnKtLOAWeG1zetM3E9M3uZ3G5DpU6bPBC2NRNbonkTvzSgOKekyvAMULFVZW9zRktlB1j4EjD1zjsAQ78eOLshgR4rrlHGWxAY8XOs0nmv4nDSeihlUREHEgk6PITQJlwWu7tbMAkpTrL7QOlPG8M6XvBTBSd1AA7QJMdRgsFIpb1FxvvN(eHOwp3qbgXPRw0SDuGPWh74(8r)0myLxsotkRO4XQAriif9MhFd6yBNU6V0NYxPZXY8vwgXZ(A8U)3ksFy0dxsaVMk22sLIqyOU6B8VDnvgcPBP4T0trdopQeeIVfX2HXgIdST)dlFBpjArMeWA70IXeCRNjaFd64Ko)jwe9GzZQLNbu)5zqlIgoIn0Fp2UVOOYAhDFgwMhj5zy2)MQclOWaHiTq5qVq7ocL7Jz9tBbUN1vIrh(n4arlXuWQwNcB(ooD4b50NsydQtFZ7tRXu6iD2uWqT5gJolRjsRJDiEpang9(SVH4BwuvpNG(BAXhUcTWmhFrPpu8G5KK911j1P5Z1LDg6I874d2pJpGzOZ)gs)Td)3UI)oku83XCLX4PSTK6Q7u8pOATXUf7dU4(H1H4L5TIASb(esbyNpLZf7WzfzBs4AEGQwh89unrAtf1hzydITgxLJTXY8YyBx6No0pTPFAX7bDDjtxgBNQkDFYkFcwYhOcKRTSSCSB5ds8aCOlAR26NrtcyRRGqRrxst1GXovMrJAJyNpxuWsC25J56vLS6lU3lCXrgmzVuJzNEDKP6yL7oJkbBN2REnJgZ1PeUKmYp9sHgv(fXKE4DW33G89UefWHFNDR312H60rpFL7Fr)wL0STKkh3YAW80Tu9LHXEsBOkakvCVFjeEMf7WU44QsqENX)yfUgUi82TGIqfeej15Ev0hJvccNWq0Iqk9BCg)c5AsuRR7LuTiJl0vMLTh7duTs371fb)xpUYq625reflI9xm4dxjhu5l3QO2L2PQ1nwur6OQ0vtROcaHagEP446aJ(yDP76FuH3ZIcZY7LGPWZGHg4io4VdB90ASAMz8AqNr3)DItiEN4nkyy4hHNcu5PswyFQL1iuzDIIRVOy6h2StDD9z(wwIVWm4QVKEsrXfH(fARKEWZ46fSy4wJR69gl9aGp(jWot(CPlHpZXcPmOnH4D2kPeFKEtPYJw1S5Y6e1UJQqK0SQQc8yxu11yUOIcmDdwc5Wd8nRkzMtC1LxuyVa6eeFrrjmp7XSsuFQ3GSDPPx8beoV6B5QgiXRVLQpdD)A82PIg)Z7qvreB3HNwLyDxJ)n1ujiL2zY4cnNy62PjQj0uGPenzQeSoFxqLzHfvuhgjcTDAgUba(n6NakA4NbMgLRqefVqwn8dahx4HjW7oVCwT7wQEbMucLiof0F4VxOFRQ8KbuFuXNhXLswYKDCQ9A8e(NO4GjxcadMzjGzRyDktuvbhEGMlQu(KGA8r2J7a1zDTiKzNkl)oetYg9NViBfPrutIngOl9OqamJI0)bxaRwxSPHr4KYPBtBvvUCS8u3LTLQ(kJDuaDK0JQx5785uAXIv3RkG10U8iYkaGBgRXvIMWJy5HTxwKlLQyTu4nU54BUaYvSwUc3PwpNZ3ZwfFfABUlBfAEwI1mn6niaX0EmVUHFKgy(MIApTAy430F8YOoFNQqzxEuCDDgR6JQIOTQOWrvTk8vxUIF4Z2mnr9gsYpk5Gk0)gwhmlgJpN4tLTHAsvcUSpr9)fRHsYhqDcproi5nxPkBPY3PCxXtDCEJU83XvstsRc6fEGk3EDwG8j1l(bzem1Z3li22pclJp(bgpiJw4tWxGTLVVLfM1J)oFqgfL0R)fbOkF83)oaQoF3a1)8FLljMFy5hLQ8Q0R250DPV5YrNDOveCuIv9lnTIPqatQUJilrRwGIs6(bxEEhYpI6eiy7J0J0cAo)AAkvouZ9qX7OHv0qu8DvuM8F)(STI3UgPeGBN(pYM1EMSa1sGn(r0JldoStYgLI5Z3LL4t2X8nOBTUJgp54ElWMHKJjFUi1tS50mEZ0j4gexghEIguOgB0VbygCaGJdoi3qDwmBQJwJ3cT2hE4)3p'

	if _detalhes:GetCurrentProfileName() ~= key then
		_detalhes:ImportProfile(profileString, key)
		_detalhes:ApplyProfile(key)

		BUI:Print(format(BUI.profileStrings[1], L['Details']))
	else
		BUI:Print(format(BUI.profileStrings[2], L['Details']))
	end
end