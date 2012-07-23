type Listzipper a = ([a],[a])

goForward :: Listzipper a -> Listzipper a
goForward (x:xs, bs) = (xs, x:bs)

goBack :: Listzipper a -> Listzipper a
goBack (xs, b:bs) = (b:xs, bs)