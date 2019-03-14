
#!/bin/bash
EOS_WALLET="/home/kumar.nirdesh/eosio-wallet"
INHERITANCE_CONTRACTS="/home/kumar.nirdesh/contracts/CONTRACTS_DIR/eosio.contracts/custom.token"
SET_CONTRACTS="/home/kumar.nirdesh/contracts"
# set these variables as per your environment
CWD=$(pwd) 
rm wallet_details.txt

cd $EOS_WALLET

rm nirdesh.wallet
rm akash.wallet
rm rahulmalu.wallet

cd $CWD
touch wallet_details.txt

private_key_eos="5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
pub_key_eos="EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"

# echo $private_key_eos
# echo $pub_key_eos


private_key_1=5JyAJ1doe6GNatou8vQcYktjVx6a8aR4MdV8et3mU5zftxc8AyG
public_key_1=EOS7p8QrzkNqUc4kPhZq7TPFjQiHwniLxNxnja3buiS9XDzjNH8te

private_key_2=5KKZiSyQARMVWyZTNdmEZnCuaba5GYtihtrmKyYqezw8M8dSeT8
public_key_2=EOS71a9ksRRKuDZPmdvJdYLSXRh9AhjVqDoi3h8H9waC7RzBXnwWj

private_key_3=5HyCKQvJriCm7hW8ygxTmFRkre3h3j5XpYH3hU26qkxM1WVUvV1
public_key_3=EOS5Q2d77oZwth5hRTghk8CL17rrPAxQ8sFmPPdV4HtPkcMkmjApa

private_key_4=5JQXVYhYK5d4wbTcTF2zGSHXQgcPSUyKiUrgVGuJEfBtfDiJsYF
public_key_4=EOS7c3n22WVSNWmyZVgnMBGf2Nfj3E9ZjWAgz1c1fUe3sXUchZ73c

private_key_5=5JawkwETENSvMfYv7cb2r2pxcsKvjw3WE95G4fmNEeywgUNQkZ6
public_key_5=EOS7YZbGCekY6rtBrLmbjfZXfcVPjQcav4mRHu4ihNFc5Y8HwssxP

private_key_6=5HqjBwyWiuqSxZFS6QguE6T7RDg54ETME43V34XhkBYRva5BPtk
public_key_6=EOS64NYjjBjNNM5RMPieCYf6JNHRst3JTrVT2h1QxEYdt86DiAM25

cleos wallet create -n nirdesh --to-console>>wallet_details.txt
cleos wallet create -n akash --to-console>>wallet_details.txt
cleos wallet create -n rahulmalu --to-console>>wallet_details.txt


echo $private_key_eos|cleos wallet import -n nirdesh
echo $private_key_1|cleos wallet import -n nirdesh
echo $private_key_2|cleos wallet import -n nirdesh

echo $private_key_eos|cleos wallet import -n akash
echo $private_key_3|cleos wallet import -n akash
echo $private_key_4|cleos wallet import -n akash

echo $private_key_eos|cleos wallet import -n rahulmalu
echo $private_key_5|cleos wallet import -n rahulmalu
echo $private_key_6|cleos wallet import -n rahulmalu

cleos create account eosio nirdesh $public_key_1 $public_key_2
cleos create account eosio akash $public_key_3 $public_key_4
cleos create account eosio rahulmalu $public_key_5 $public_key_6


cd $INHERITANCE_CONTRACTS

# eosio-cpp -o custom.token.wasm custom.token.cpp --abigen

cd $SET_CONTRACTS

# cleos set contract nirdesh CONTRACTS_DIR/eosio.contracts/custom.token -p nirdesh@active

echo "contract is set..."


