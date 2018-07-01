-- You can benchmark your code quickly and effectively with Criterion. See its
-- website for help: <http://www.serpentine.com/criterion/>.
import Criterion.Main
import qualified Crypto.KDF.BCrypt as BCrypt
import Data.ByteString (ByteString)

plainText :: ByteString
plainText = "correcthorsebatterystaple" 

hashPassword :: Int -> IO ByteString
hashPassword cost = BCrypt.hashPassword cost plainText

main :: IO ()
main = defaultMain [
  bgroup "hash" [ bench "4"  $ whnfIO $ hashPassword 4
                , bench "9"  $ whnfIO $ hashPassword 9
                , bench "10" $ whnfIO $ hashPassword 10
                , bench "11" $ whnfIO $ hashPassword 11
                , bench "12" $ whnfIO $ hashPassword 12
                , bench "13" $ whnfIO $ hashPassword 13
                , bench "14" $ whnfIO $ hashPassword 14
                , bench "15" $ whnfIO $ hashPassword 15
                ]
  ]

